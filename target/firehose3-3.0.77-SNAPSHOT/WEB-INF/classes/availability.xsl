<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
							  xmlns:ns2="http://schemas.sirsidynix.com/symws/common" 
							  xmlns:ns4="http://schemas.sirsidynix.com/symws/security" 
							  xmlns:ns3="http://schemas.sirsidynix.com/symws/patron">
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>	
    
    <xsl:param name="rawdoc"/>

	<xsl:template match="/ns3:LookupTitleInfoResponse">
	 <catalogItem>
		<xsl:attribute name="key">
    		<xsl:value-of select="ns3:TitleInfo/ns3:titleID"/>
    	</xsl:attribute>	
  	
  	<pin>
   			<xsl:value-of select="$rawdoc"/>
   		</pin>	
  	
  </catalogItem> 
		
		
	</xsl:template>
	
</xsl:stylesheet>