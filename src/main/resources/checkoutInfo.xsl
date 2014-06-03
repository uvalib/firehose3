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
		<xsl:attribute name="computingId">
    		<xsl:value-of select="ns3:patronInfo/ns3:alternativeID"/>
  		</xsl:attribute>
		<xsl:attribute name="sirsiId">
    		<xsl:value-of select="ns3:patronInfo/ns3:userID"/>
  		</xsl:attribute>
		<xsl:attribute name="key">
    		<xsl:value-of select="ns3:patronInfo/ns3:userKey"/>
  		</xsl:attribute>
  		
  		<xsl:for-each select="ns3:patronCheckoutInfo">
  			<checkout>
  				<catalogItem>
					<xsl:attribute name="catkey">
    					<xsl:value-of select="ns3:titleKey"/>
  					</xsl:attribute>
  					<xsl:attribute name="barcode">
    					<xsl:value-of select="ns3:itemID"/>
  					</xsl:attribute>  				
  					<catkey>
  						<xsl:value-of select="ns3:titleKey"/>
  					</catkey>
  					<authors>
  						<xsl:value-of select="ns3:author"/>
  					</authors>
 					<title>
  						<xsl:value-of select="ns3:title"/>
  					</title>
  					<subtitle>
  					</subtitle>
  					<callnumber>
  						<xsl:value-of select="ns3:callNumber"/>
  					</callnumber>
  					<checkoutLibrary>
  						<xsl:value-of select="ns3:checkoutLibraryID"/>  					
  					</checkoutLibrary>
   					<checkoutLibraryDesc>
  						<xsl:value-of select="ns3:checkoutLibraryDescription"/>   					
   					</checkoutLibraryDesc>
   					<dateCharged>
   						<xsl:value-of select="ns3:checkoutDate"/>
   					</dateCharged>
   					<dateDue>
   						<xsl:value-of select="ns3:dueDate"/>
   					</dateDue>
   					<overdue>
   						<xsl:value-of select="ns3:overdue"/>
   					</overdue>
   					<renewable>
   					<xsl:choose>
   						<xsl:when test="recallDate">
   							<xsl:text>false</xsl:text>
   						</xsl:when>
   						<xsl:otherwise>
   							<xsl:if test="ns3:renewalsRemainingUnlimited='true'">
   								<xsl:text>true</xsl:text>
   							</xsl:if>
   						</xsl:otherwise>	
   					</xsl:choose>
   					</renewable>
   					<dateRecalled>
   						<xsl:value-of select="recallDate"/>
   					</dateRecalled>
   					<dateRecallDue>
   						<xsl:value-of select="recallDueDate"/>
   					</dateRecallDue>
   					<renewals>
   						<xsl:value-of select="ns3:renewals"/>
   					</renewals>
   					<renewalsRemaining>
   						<xsl:value-of select="ns3:renewalsRemaining"/>
   					</renewalsRemaining>

   					<renewalsUnlimited>
   						<xsl:value-of select="ns3:renewalsRemainingUnlimited"/>
   					</renewalsUnlimited>
  				</catalogItem>
  				
				<!-- <xsl:value-of select="."/> -->
				
			</checkout>
		</xsl:for-each>

  		
  	
  </user> 
		
		
	</xsl:template>
	
</xsl:stylesheet>