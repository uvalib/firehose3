<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
							  xmlns:sec="http://schemas.sirsidynix.com/symws/security"
    xmlns:pat="http://schemas.sirsidynix.com/symws/patron"
    xmlns:sta="http://schemas.sirsidynix.com/symws/standard"
    xmlns:com="http://schemas.sirsidynix.com/symws/common"
    xmlns:cir="http://schemas.sirsidynix.com/symws/circulation"
							  xmlns:tmp="tmp:tmp">
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>	
    
    <xsl:param name="upin"/>
	<xsl:param name="ufname"/>
	<xsl:param name="umname"/>
	<xsl:param name="ulname"/>    
    <xsl:param name="ucat1"/>
	<xsl:param name="ucat5"/>
	<xsl:param name="uprofile"/>
	<xsl:param name="ustatus"/>
	<xsl:param name="udelinquent" />
	<xsl:param name="udepartment" />            
	
    
	<xsl:template match="/pat:LookupPatronInfoResponse">
	  <user>
		<xsl:attribute name="computingId">
    		<xsl:value-of select="pat:patronInfo/pat:alternativeID"/>
  		</xsl:attribute>
		<xsl:attribute name="sirsiId">
    		<xsl:value-of select="pat:patronInfo/pat:userID"/>
  		</xsl:attribute>
		<xsl:attribute name="key">
    		<xsl:value-of select="pat:patronInfo/pat:userKey"/>
  		</xsl:attribute> 
   		<pin>
   			<xsl:value-of select="$upin"/>
   		</pin>
  		<barred>
  			<xsl:value-of select="pat:patronStatusInfo/pat:statusID"/>
  		</barred>
  		<barredMessage>
  			<xsl:value-of select="pat:patronStatusInfo/pat:statusMessage"/>
  		</barredMessage>
  		<displayName>
  		  <xsl:value-of select="pat:patronInfo/pat:displayName"/>
  		</displayName>
  		<firstname>
  			<xsl:value-of select="$ufname"/>
  		</firstname>
		<middlename>
  			<xsl:value-of select="$umname"/>
  		</middlename>
		<lastname>
  			<xsl:value-of select="$ulname"/>
  		</lastname>
  		<!-- 
  		<profile>
  		 <xsl:for-each select="document('SirsiLookups.xml')/lookups/profile/policyvalue[@id = $uprofile]">
         	<xsl:value-of select="@pval"/>
         </xsl:for-each>
  		</profile>
  		-->
  		<description>
  			<xsl:value-of select="$udepartment"/>
  		</description>
  		<totalCheckouts>
  		  	<xsl:value-of select="pat:patronCirculationInfo/pat:numberOfCheckouts"/>  		
  		</totalCheckouts>	
  		<totalHolds>
  		  	<xsl:value-of select="pat:patronCirculationInfo/pat:numberOfHolds"/>  		
  		</totalHolds>	
  		<totalOverdue>
  		  	<xsl:value-of select="count(pat:patronCheckoutInfo[pat:overdue='true'])"/>  	
  		</totalOverdue>	
  		<totalRecallsBy>
  		  	<xsl:value-of select="count(pat:patronCheckoutInfo/recallDate)"/>
  		</totalRecallsBy>
  		<totalRecallsFrom>
  		
  		</totalRecallsFrom>
  		<totalReserves>
  		  	<xsl:value-of select="count(pat:patronHoldInfo[pat:reserve='true'])"/>  		
  		</totalReserves>	
 	  </user>
	</xsl:template>
</xsl:stylesheet>