
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

//import org.apache.camel.ProducerTemplate;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.apache.camel.Exchange;
import org.apache.camel.Message;
import org.apache.camel.Processor;
import org.apache.camel.language.XPath;
import org.apache.camel.spring.SpringRouteBuilder;
//import org.apache.camel.impl.DefaultProducerTemplate;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

public class StandardRouteBuilder extends SpringRouteBuilder {
	 
	  @Override
	  public void configure() throws Exception {
	 
		  from("direct:solr")
		    .routeId("getsolr")
		    .log("Looking up solr : ${header.catkey}")
		    .setHeader("CamelHttpUri", constant("http://libsvr25.lib.virginia.edu:8080/solr/searchtest/select/?"))
		    .setHeader("CamelHttpQuery", simple("q=id%3a${header.catkey}&amp;version=2.2&amp;start=0&amp;rows=10&amp;indent=on&amp;qt=standard"))
		    .to("http://bogusaddress")
		    .to("mock:end");
		  

	  }
	  
	  
	}