<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
							  xmlns:ns2="http://schemas.sirsidynix.com/symws/common" 
							  xmlns:ns4="http://schemas.sirsidynix.com/symws/security" 
							  xmlns:ns3="http://schemas.sirsidynix.com/symws/patron">
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>	
    
	<xsl:template match="/ns3:LookupPatronInfoResponse">
		<user>
			<xsl:attribute name="computingId">
    			<xsl:value-of select="ns3:patronInfo/ns3:alternativeID"/>
  			</xsl:attribute>
			<xsl:attribute name="sirsiId">
    			<xsl:value-of select="ns3:patronInfo/ns3:userID"/>
  			</xsl:attribute>
			<xsl:attribute name="key">
    			<xsl:value-of select="ns3:patronInfo/ns3:userKey"/>
  			</xsl:attribute>
  			<xsl:for-each select="ns3:patronHoldInfo">
  				<hold>
  					<holdKey>
  						<xsl:value-of select="ns3:holdKey"/>
  					</holdKey>
  					<titleKey>
  						<xsl:value-of select="ns3:titleKey"/>
  					</titleKey>
  					<title>
  						<xsl:value-of select="ns3:title"/>
  					</title>
  					<subtitle>
  				
  					</subtitle>
					<author>
  						<xsl:value-of select="ns3:author"/>
  					</author>
					<datePlaced>
  						<xsl:value-of select="ns3:placedDate"/>
  					</datePlaced>
					<pickupLibrary>
  						<xsl:value-of select="ns3:pickupLibraryID"/>
  					</pickupLibrary>
  					<type>
			  	        <xsl:choose>
			        		<xsl:when test="ns3:orderID">
			          			<xsl:text>hold</xsl:text>
			        		</xsl:when>
					        <xsl:otherwise>
			            		<xsl:text>recall</xsl:text>
			        		</xsl:otherwise>
			      		</xsl:choose>

  					</type>
  					<recallStatus>
  						<xsl:value-of select="ns3:recallStatus"/>
  					</recallStatus>
    				<academicReserve>
    					<xsl:value-of select="ns3:reserve"/>
    				</academicReserve>	
    					
    					
  				</hold>	  				
  			</xsl:for-each>
  		</user>	  
  	</xsl:template>
</xsl:stylesheet>