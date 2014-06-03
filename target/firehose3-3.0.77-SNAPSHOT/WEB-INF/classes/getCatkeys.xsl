<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
							  xmlns:ns2="http://schemas.sirsidynix.com/symws/common" 
							  xmlns:ns4="http://schemas.sirsidynix.com/symws/security" 
							  xmlns:ns3="http://schemas.sirsidynix.com/symws/patron">
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>	
    
    <xsl:param name="upin"/>
	<xsl:param name="ufname"/>
	<xsl:param name="umname"/>
	<xsl:param name="ulname"/>    

	<xsl:template match="/ns3:LookupPatronInfoResponse">
	 <user>
  		<xsl:for-each select="ns3:patronCheckoutInfo">
  			
 					<catkey>
					<xsl:attribute name="catkey">
    					<xsl:value-of select="ns3:titleKey"/>
  					</xsl:attribute>
 					</catkey>
 		</xsl:for-each>

  		
  	
  </user> 
		
		
	</xsl:template>
	
</xsl:stylesheet>