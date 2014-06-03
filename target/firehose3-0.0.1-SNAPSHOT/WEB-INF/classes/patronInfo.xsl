<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
							  xmlns:ns2="http://schemas.sirsidynix.com/symws/common" 
							  xmlns:ns4="http://schemas.sirsidynix.com/symws/security" 
							  xmlns:ns3="http://schemas.sirsidynix.com/symws/patron"
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
   		<pin>
   			<xsl:value-of select="$upin"/>
   		</pin>
  		<barred>
  			<xsl:value-of select="ns3:patronStatusInfo/ns3:statusID"/>
  		</barred>
  		<barredMessage>
  			<xsl:value-of select="ns3:patronStatusInfo/ns3:statusMessage"/>
  		</barredMessage>
  		<displayName>
  		  <xsl:value-of select="ns3:patronInfo/ns3:displayName"/>
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
  		  	<xsl:value-of select="ns3:patronCirculationInfo/ns3:numberOfCheckouts"/>  		
  		</totalCheckouts>	
  		<totalHolds>
  		  	<xsl:value-of select="ns3:patronCirculationInfo/ns3:numberOfHolds"/>  		
  		</totalHolds>	
  		<totalOverdue>
  		  	<xsl:value-of select="count(ns3:patronCheckoutInfo[ns3:overdue='true'])"/>  	
  		</totalOverdue>	
  		<totalRecallsBy>
  		  	<xsl:value-of select="count(ns3:patronCheckoutInfo/recallDate)"/>
  		</totalRecallsBy>
  		<totalRecallsFrom>
  		
  		</totalRecallsFrom>
  		<totalReserves>
  		  	<xsl:value-of select="count(ns3:patronHoldInfo[ns3:reserve='true'])"/>  		
  		</totalReserves>	
 	  </user>
	</xsl:template>
</xsl:stylesheet>