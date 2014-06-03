
/*******************************************************************************
* Copyright 2014 The Rector and Visitors of the University of Virginia
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
******************************************************************************/

package edu.virginia.lib.firehose3;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;


import org.apache.camel.CamelContext;
import org.apache.camel.CamelContextAware;
import org.apache.camel.Consume;
import org.apache.camel.EndpointInject;
import org.apache.camel.Exchange;
import org.apache.camel.Produce;
import org.apache.camel.ProducerTemplate;
import org.apache.camel.builder.xml.XPathBuilder;
import org.apache.camel.converter.stream.InputStreamCache;
import org.apache.camel.impl.DefaultExchange;
import org.apache.commons.io.IOUtils;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.thoughtworks.xstream.XStream;

import javax.xml.xpath.*;

public class EnrichBean implements CamelContextAware {

      // Declare producer endpoint and inject it context
	  // Delcare Camel Context
	
	  @EndpointInject(uri="direct:solr")
	  ProducerTemplate producer;
	  protected CamelContext camelContext; 
	  
	  // Used for blending shadowed record information in Oracle with item info from SirsiWS
	  // No longer needed, but kept just in case
	  public void readJDBCresult(ArrayList<HashMap<String, Object>> list) {
		  XStream xx = new XStream();
		  String xxml = xx.toXML(list.toString());
		  for (int a =0; a<list.size();a++)
	        {
	            HashMap<String, Object> tmpData = (HashMap<String, Object>) list.get(a);
	            Set<String> key = tmpData.keySet();
	            Iterator it = key.iterator();
	            while (it.hasNext()) {
	                String hmKey = (String)it.next();
	                Object hmData = (Object) tmpData.get(hmKey);
                   //it.remove(); // avoids a ConcurrentModificationException
	            }
	        }   
		  
	  }
			  
	  
        // Concats exchange docs with a configurable delimiter
	  
	    public Exchange aggregate(Exchange aggregate, Exchange newEx) {
 		    String delim = ", ";
		  		    
  	        if (aggregate == null) {
  	        	// If only one message, return
  	            return newEx;
  	        } else {
  	            // Otherwise, concat and return with new incoming exchange
  	                String originalBody = aggregate.getIn().getBody(String.class);
  	                String bodyToAdd = newEx.getIn().getBody(String.class);
  	                aggregate.getIn().setBody(originalBody + delim + bodyToAdd);
  	                return aggregate;
  	        }  
  	    }
		  	 
	    
	    // Writes a set of exchange docs to HashSet
	    // Used for shadowed and bound with pulls from Oracle
	    // No longer needed but kept just in case
	    
	    public Exchange aggregateHashSet(Exchange oldEx, Exchange newEx) {
	     
	    	String body = newEx.getIn().getBody(String.class);
	        
	    	if (oldEx == null) {
	            Set<String> hs = new HashSet<String>();
	            hs.add(body);
	            newEx.getIn().setBody(hs);
	            return newEx;
	        } else {
	            Set<String> hs = oldEx.getIn().getBody(Set.class);
	            hs.add(body);
	            return oldEx;
	        }
	    }
	  
      // Uses a stream cache to fetch solr docs. Tried this in the Spring DSL, but could not get StreamCaching
	  // to work without error so implemented in Java DSL
	    
	  public String getSolrDoc(String ckey)  {
			  
		  String multipartXmlMessage = null;
		
		  InputStreamCache iscache = (InputStreamCache) producer.requestBodyAndHeader("direct:solr", null, "catkey", "u" + ckey);
		  try {
		     multipartXmlMessage = IOUtils.toString(iscache);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	      return multipartXmlMessage;
	  }
	  
	  
	  // Substring unwanted elements out of returned Solr doc.
	  
	  public String getElementFromSolrDoc (String xpqry, String solrDoc) {
		  
		   String randomelement = XPathBuilder.xpath(xpqry).evaluate(camelContext, solrDoc);
		   String cleanedup = randomelement.replaceAll("=", "");
		   return cleanedup;
	  }
	  
	  
	// Enrich Sirsi WS doc with Sub-Title information from Solr.
	  
	public Document enrich(Document doc) throws XPathExpressionException {
    	
        // Get nodelist of catkeys   	
        NodeList nodelist = doc.getElementsByTagName("catalogItem"); 
    	
        for (int temp = 0; temp < nodelist.getLength(); temp++) {
        	 
    		Node nNode = nodelist.item(temp);
    		NamedNodeMap attributes = nNode.getAttributes();
    		String ckey = attributes.getNamedItem("catkey").getNodeValue();
    		// Call Solr with catkey
    		String sd = getSolrDoc(ckey);
    		
    		// Locate correct node for updating
    		NodeList nl = nNode.getChildNodes();
    		Element el = (Element) nl;
    		// Set Title and Sub-Title
    		el.getElementsByTagName("title").item(0).setTextContent(getElementFromSolrDoc("/response/result/doc/arr[@name=\"title_display\"]/str", sd));
    		el.getElementsByTagName("subtitle").item(0).setTextContent(getElementFromSolrDoc("/response/result/doc/arr[@name=\"subtitle_display\"]/str", sd));
    		
            // debugging
    		//nNode.getChildNodes().item(7).setTextContent(getElementFromSolrDoc("/response/result/doc/arr[@name=\"title_display\"]/str", sd));
    		//nNode.getChildNodes().item(7).getNextSibling().setTextContent(getElementFromSolrDoc("/response/result/doc/arr[@name=\"subtitle_display\"]/str", sd));
    		//nNode.getChildNodes().item(8).setTextContent(getElementFromSolrDoc("/response/result/doc/arr[@name=\"subtitle_display\"]/str", sd));
    		
    		
        }	
         return doc;
    }

    
	// Getter for Camel Context
    public CamelContext getCamelContext() {
        return camelContext;
    }

    // Setter for Camel Context
    public void setCamelContext(CamelContext camelContext) {
        this.camelContext = camelContext;
    } 
	
}