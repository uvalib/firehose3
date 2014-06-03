<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:sta="http://schemas.sirsidynix.com/symws/standard">
 
    <xsl:output method="xml" indent="yes" encoding="UTF-8"  omit-xml-declaration="yes"/>	
    

	<xsl:template match="/sta:LookupTitleInfoResponse">
	 <catalogItem>
		<xsl:attribute name="key">
    		<xsl:value-of select="sta:TitleInfo/sta:titleID"/>
    	</xsl:attribute>	
  	 <authors>
  	 	<xsl:value-of select="sta:TitleInfo/sta:author"/>
  	 </authors>
  	 <canHold>
  	 <xsl:attribute name="messageCode">
    		<xsl:value-of select="sta:TitleInfo/sta:titleID"/>
    	</xsl:attribute>	
    	<xsl:attribute name="name">
    		<xsl:value-of select="sta:TitleInfo/sta:titleID"/>
    	</xsl:attribute>	
    	<xsl:attribute name="value">
    		<xsl:value-of select="sta:TitleInfo/sta:TitleAvailabilityInfo/sta:holdable"/>
    	</xsl:attribute>
    	<message></message>	
  	 
  	 </canHold>
  	<holding>
  		<xsl:attribute name="callNumber">
    		<xsl:value-of select="sta:TitleInfo/sta:baseCallNumber"/>
    	</xsl:attribute>	
		<xsl:attribute name="callSequence">
    		<!-- <xsl:value-of select="sta:TitleInfo/sta:titleID"/> -->
    	</xsl:attribute>	
		<xsl:attribute name="holdable">
    		<xsl:value-of select="sta:TitleInfo/sta:TitleAvailabilityInfo/sta:holdable"/>
    	</xsl:attribute>	
		<xsl:attribute name="shadowed">
    		<!-- <xsl:value-of select="sta:TitleInfo/sta:titleID"/> -->
    	</xsl:attribute>	
		<catalogKey>
			<xsl:value-of select="sta:TitleInfo/sta:titleID"/>
		</catalogKey>
		<copy>
  		<xsl:attribute name="copyNumber">
    		<xsl:value-of select="sta:TitleInfo/sta:titleID"/>
    	</xsl:attribute>	
		<xsl:attribute name="currentPeriodical">
    		<xsl:value-of select="sta:TitleInfo/sta:titleID"/>
    	</xsl:attribute>	
		<xsl:attribute name="barCode">
    		<xsl:value-of select="sta:TitleInfo/sta:CallInfo/sta:ItemInfo/sta:itemID"/>
    	</xsl:attribute>	
		<xsl:attribute name="shadowed">
    		<xsl:value-of select="sta:TitleInfo/sta:titleID"/>
    	</xsl:attribute>	
		<circulate></circulate>
		<currentLocation>
		<xsl:attribute name="code">
    		<xsl:value-of select="sta:TitleInfo/sta:titleID"/>
    	</xsl:attribute>	
		<xsl:attribute name="id">
    		<xsl:value-of select="sta:TitleInfo/sta:titleID"/>
    	</xsl:attribute>	
		<name>
		<xsl:value-of select="sta:TitleInfo/sta:CallInfo/sta:ItemInfo/sta:currentLocationID"/>
		</name>
		</currentLocation>
		<homeLocation>
		<xsl:attribute name="code">
    		<xsl:value-of select="sta:TitleInfo/sta:titleID"/>
    	</xsl:attribute>	
		<xsl:attribute name="id">
    		<xsl:value-of select="sta:TitleInfo/sta:titleID"/>
    	</xsl:attribute>	
		<name>
		<xsl:value-of select="sta:TitleInfo/sta:CallInfo/sta:ItemInfo/sta:homeLocationID"/>
		</name>
		</homeLocation>
		<itemType>
		<xsl:attribute name="code">
    		<xsl:value-of select="sta:TitleInfo/sta:materialType"/>
    	</xsl:attribute>	
		<xsl:attribute name="id">
    		<xsl:value-of select="sta:TitleInfo/sta:titleID"/>
    	</xsl:attribute>	
		
		</itemType>
		<lastCheckout></lastCheckout>
		</copy>
		<library>
		<xsl:attribute name="code">
    		<xsl:value-of select="sta:TitleInfo/sta:CallInfo/sta:libraryID"/>
    	</xsl:attribute>	
		<xsl:attribute name="id">
    		<xsl:value-of select="sta:TitleInfo/sta:titleID"/>
    	</xsl:attribute>	
		<deliverable></deliverable>
		<holdable>
			<xsl:value-of select="sta:TitleInfo/sta:TitleAvailabilityInfo/sta:holdable"/>
		</holdable>
		<name>
			<xsl:value-of select="sta:TitleInfo/sta:TitleAvailabilityInfo/sta:libraryWithAvailableCopies"/>
		</name>
		<remote></remote>		
		</library>
		<shelvingKey>
			<xsl:value-of select="sta:TitleInfo/sta:baseCallNumber"/>
		</shelvingKey>
  	</holding>	
  	<publishDate>
  		<xsl:value-of select="sta:TitleInfo/sta:yearOfPublication"/>
  	</publishDate>
  	<status></status>
  	<title>
  		<xsl:value-of select="sta:TitleInfo/sta:title"/>
  	</title>
  </catalogItem> 
		
		
	</xsl:template>
	
</xsl:stylesheet>