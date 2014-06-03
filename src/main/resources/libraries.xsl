<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
							  xmlns:ns2="http://schemas.sirsidynix.com/symws/common"
							  xmlns:ns3="http://schemas.sirsidynix.com/symws/patron" 
							  xmlns:ns4="http://schemas.sirsidynix.com/symws/security" 
							  xmlns:ns5="http://schemas.sirsidynix.com/symws/admin">
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

	<xsl:template match="/ns5:LookupLibraryPolicyListResponse">
	 <libraries>
	 	<xsl:for-each select="ns5:policyInfo">
	   <library>
	   		<xsl:attribute name="code">
    			<xsl:value-of select="ns5:policyID"/>
    		</xsl:attribute>
	   		<xsl:attribute name="id">
    			<xsl:value-of select="ns5:policyNumber"/>
    		</xsl:attribute>
       	<deliverable></deliverable>
       	<holdable></holdable>
       	<name>
       	 	<xsl:value-of select="ns5:policyDescription"/>
       	</name>
       	<remote></remote>	
	   </library>
	   </xsl:for-each>
   </libraries> 
		
		
	</xsl:template>

</xsl:stylesheet>