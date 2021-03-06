<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
				xmlns:MSHelp="http://msdn.microsoft.com/mshelp"
        xmlns:mshelp="http://msdn.microsoft.com/mshelp"
				xmlns:ddue="http://ddue.schemas.microsoft.com/authoring/2003/5"
				xmlns:xlink="http://www.w3.org/1999/xlink"
        xmlns:msxsl="urn:schemas-microsoft-com:xslt"
         >

  <xsl:import href="globalTemplates.xsl"/>
  <xsl:template name="upperBodyStuff">
    <input type="hidden" id="userDataCache" class="userDataStyle"/>
    <input type="hidden" id="hiddenScrollOffset"/>

    <xsl:call-template name="commonImages"/>

    <xsl:call-template name="bodyHeader"/>

  </xsl:template>

  <xsl:template name="bodyHeader">
    <xsl:call-template name="googleTop"/>
    <div id="header">
      <xsl:call-template name="bodyHeaderTopTable"/>
      <xsl:call-template name="bodyHeaderBottomTable"/>
    </div>

  </xsl:template>
  <xsl:template name="lowerBodyStuff">
    <input type="hidden" id="userDataCache" class="userDataStyle"/>
    <input type="hidden" id="hiddenScrollOffset"/>
    <div id="header2">
      <table cellpadding="2" cellspacing="0" width="100%" height="130px">
        <tr>
          <td class="nsrBottom">
            <includeAttribute name="background" item="iconPath">
              <parameter>gradient.gif</parameter>
            </includeAttribute>
          </td>
        </tr>
        <tr style="vertical-align: top">
          <td>
            <xsl:call-template name="googleBottom"/>
          </td>
        </tr>
      </table>
    </div>
    
  </xsl:template>
  <xsl:template name="googleBottom">
    <div>
      <script type="text/javascript">
        google_ad_client = "pub-0695471944567790";
        google_ad_slot = "3951004458";
        google_ad_width = 728;
        google_ad_height = 90;
      </script>
      <script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
        <p/>
      </script>
    </div>
  </xsl:template>
  <xsl:template name="googleAnalitics">
    <script type="text/javascript">
      var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
      document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
    </script>
    <script type="text/javascript">
      try {
      var pageTracker = _gat._getTracker("UA-6818165-2");
      pageTracker._trackPageview();
      } catch(err) {}
    </script>
  </xsl:template>
  <xsl:template name="googleTop">
    <div>
      <script type="text/javascript">
        google_ad_client = "pub-0695471944567790";
        google_ad_slot = "1436496759";
        google_ad_width = 728;
        google_ad_height = 15;
      </script>
      <script type="text/javascript"
      src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
        <p/>
      </script>
    </div>
  </xsl:template>
  <xsl:template name="bodyHeaderBottomTable">
    <table id="bottomTable" cellpadding="0" cellspacing="0">
      <tr id="headerTableRow1">
        <td align="left">
          <span id="runningHeaderText">
            <xsl:call-template name="runningHeader" />
          </span>
        </td>
      </tr>
      <tr id="headerTableRow2">
        <td align="left">
          <span id="nsrTitle">
            <include item="nsrTitle">
              <parameter>
                <xsl:call-template name="topicTitleDecorated"/>
              </parameter>
            </include>
          </span>
        </td>
      </tr>
      <tr id="headerTableRow3">
        <td align="left">
          <xsl:call-template name="headerRowLinks"/>
        </td>
        <!--<td align="right">
          <span id="headfb" class="feedbackhead"></span>
        </td>-->
      </tr>
    </table>
    <table id="gradientTable">
      <tr>
        <td>
          <div style="text-align: right">

            <style type="text/css">
              @import url(http://www.google.com/cse/api/branding.css);
            </style>
            <div class="cse-branding-bottom" style="background-color:#FFFFFF;color:#000000">
              <div class="cse-branding-form">
                <form action="http://www.google.pl/cse" id="cse-search-box" target="_blank">
                  <div>
                    <input type="hidden" name="cx" value="partner-pub-0695471944567790:axcy3qfh18" />
                    <input type="hidden" name="ie" value="ISO-8859-1" />
                    <input type="text" name="q" size="40" />
                    <input type="submit" name="sa" value="Search" />
                  </div>
                </form>
              </div>
              <div class="cse-branding-logo" style="float:right;">
                <img src="http://www.google.com/images/poweredby_transparent/poweredby_FFFFFF.gif" alt="Google" />
              </div>
              <div class="cse-branding-text" style="float:right;">

              </div>
            </div>

          </div>
        </td>
      </tr>
      <tr>
        <td class="nsrBottom">
          <includeAttribute name="background" item="iconPath">
            <parameter>gradient.gif</parameter>
          </includeAttribute>
        </td>
      </tr>
    </table>
  </xsl:template>

  <xsl:template name="memberTableLink">
    <xsl:param name="headerGroup" />
    <xsl:variable name="sectionId">
      <xsl:value-of select="concat($headerGroup, 'TableToggle')"/>
    </xsl:variable>
    <include item="nsrLinkSeparator"/>
    <a href="#{$sectionId}" onclick="OpenSection({$sectionId})">
      <include item="{$headerGroup}Table"/>
    </a>
    <xsl:text>&#xa0;</xsl:text>
  </xsl:template>

  <xsl:template name="headerRowLinks">
    <xsl:variable name="hasTypeLink" select="/document/reference/topicdata/@typeTopicId or /document/reference/containers/type/@api"/>
    <xsl:variable name="hasMembersLink" select="/document/reference/topicdata/@allMembersTopicId and ($subgroup='class' or $subgroup='structure' or $subgroup='interface')"/>

    <!-- Member list pages and member pages get link to Type Overview pages -->
    <xsl:choose>
      <xsl:when test="/document/reference/topicdata/@typeTopicId">
        <referenceLink target="{/document/reference/topicdata/@typeTopicId}" display-target="format">
          <xsl:call-template name="nonScrollingRegionTypeLinks" />
        </referenceLink>
        <xsl:text>&#xa0;</xsl:text>
      </xsl:when>
      <xsl:when test="/document/reference/containers/type/@api">
        <referenceLink target="{/document/reference/containers/type/@api}" display-target="format">
          <xsl:call-template name="nonScrollingRegionTypeLinks" />
        </referenceLink>
        <xsl:text>&#xa0;</xsl:text>
      </xsl:when>
    </xsl:choose>

    <!-- class, structure, and interface About topics get link to Members topic (unless the doc model has the all members lists on the type topic) -->
    <xsl:if test="$hasMembersLink">
      <xsl:if test="$hasTypeLink">
        <include item="nsrLinkSeparator"/>
      </xsl:if>
      <referenceLink target="{/document/reference/topicdata/@allMembersTopicId}">
        <include item="allMembersTitle"/>
      </referenceLink>
      <xsl:text>&#xa0;</xsl:text>
    </xsl:if>

    <!--all members only -->
    <xsl:if test="$subgroup='members'">
      <xsl:if test="/document/reference/elements/element/apidata[@subgroup='constructor']">
        <!-- add a link to the member list section for this subgroup -->
        <xsl:call-template name="memberTableLink">
          <xsl:with-param name="headerGroup">constructor</xsl:with-param>
        </xsl:call-template>
      </xsl:if>

      <!-- method subgroup includes operators -->
      <xsl:if test="/document/reference/elements/element/apidata[@subgroup='method']">
        <xsl:call-template name="memberTableLink">
          <xsl:with-param name="headerGroup">method</xsl:with-param>
        </xsl:call-template>
      </xsl:if>

      <xsl:if test="/document/reference/elements/element/apidata[@subgroup='field']">
        <xsl:call-template name="memberTableLink">
          <xsl:with-param name="headerGroup">field</xsl:with-param>
        </xsl:call-template>
      </xsl:if>

      <xsl:if test="/document/reference/elements/element/apidata[@subgroup='property' and not(@subsubgroup)]">
        <xsl:call-template name="memberTableLink">
          <xsl:with-param name="headerGroup">property</xsl:with-param>
        </xsl:call-template>
      </xsl:if>

      <xsl:if test="/document/reference/elements/element/apidata[@subsubgroup='attachedProperty']">
        <xsl:call-template name="memberTableLink">
          <xsl:with-param name="headerGroup">attachedProperty</xsl:with-param>
        </xsl:call-template>
      </xsl:if>

      <xsl:if test="/document/reference/elements/element/apidata[@subgroup='event' and not(@subsubgroup)]">
        <xsl:call-template name="memberTableLink">
          <xsl:with-param name="headerGroup">event</xsl:with-param>
        </xsl:call-template>
      </xsl:if>

      <xsl:if test="/document/reference/elements/element/apidata[@subsubgroup='attachedEvent']">
        <xsl:call-template name="memberTableLink">
          <xsl:with-param name="headerGroup">attachedEvent</xsl:with-param>
        </xsl:call-template>
      </xsl:if>

      <xsl:if test="/document/reference/elements/element[memberdata[@visibility='private'] and proceduredata[@virtual = 'true']]">
        <xsl:call-template name="memberTableLink">
          <xsl:with-param name="headerGroup">ExplicitInterfaceImplementation</xsl:with-param>
        </xsl:call-template>
      </xsl:if>

    </xsl:if>

    <!-- include Example link if there's an Example section -->
    <xsl:if test="$examplesSection">
      <xsl:if test="$hasTypeLink or $hasMembersLink">
        <include item="nsrLinkSeparator"/>
      </xsl:if>
      <a href="#exampleToggle" onclick="OpenSection(exampleToggle)">
        <include item="Example"/>
      </a>
      <xsl:text>&#xa0;</xsl:text>
    </xsl:if>

    <!-- most mref topics get autogenerated see also links to see also section -->
    <xsl:if test="$hasSeeAlsoSection">
      <xsl:if test="$hasTypeLink or $hasMembersLink or $examplesSection">
        <include item="nsrLinkSeparator"/>
      </xsl:if>
      <a href="#seeAlsoToggle" onclick="OpenSection(seeAlsoToggle)">
        <include item="SeeAlso"/>
      </a>
      <xsl:text>&#xa0;</xsl:text>
    </xsl:if>

    <!-- Feedback link -->
    <xsl:if test="$hasTypeLink or $hasMembersLink or $examplesSection or $hasSeeAlsoSection">
      <include item="nsrLinkSeparator"/>
    </xsl:if>
    <include item="feedbackHeader">
      <parameter>
        <xsl:value-of select="/document/metadata/item[@id='PBM_FileVersion']" />
      </parameter>
      <parameter>
        <xsl:value-of select="/document/metadata/attribute[@name='TopicVersion']" />
      </parameter>
    </include>

  </xsl:template>


  <xsl:template name="bodyHeaderTopTable">
    <xsl:variable name="showDevlangsFilter" select="boolean(($languages != 'false') and (count($languages/language) &gt; 0))"/>
    <xsl:variable name="showMemberOptionsFilter" select="boolean($group='list' and $subgroup!='DerivedTypeList')"/>
    <xsl:variable name="showMemberFrameworksFilter" select="boolean($group='list' and $subgroup!='DerivedTypeList' and /document/reference/elements//element/versions/versions)"/>
    <table id="topTable" cellspacing="0" cellpadding="0">
      <tr>
        <td>
          <span onclick="ExpandCollapseAll(toggleAllImage)" style="cursor:default;" onkeypress="ExpandCollapseAll_CheckKey(toggleAllImage, event)" tabindex="0">
            <img ID="toggleAllImage" class="toggleAll">
              <includeAttribute name="src" item="iconPath">
                <parameter>collapse_all.gif</parameter>
              </includeAttribute>
            </img>
            <xsl:text>&#xa0;</xsl:text>
            <label id="collapseAllLabel" for="toggleAllImage" style="display: none;">
              <include item="collapseAll"/>
            </label>
            <label id="expandAllLabel" for="toggleAllImage" style="display: none;">
              <include item="expandAll"/>
            </label>
            <xsl:text>&#160;</xsl:text>
          </span>

          <xsl:if test="boolean($showDevlangsFilter)">
            <xsl:call-template name="devlangsDropdown"/>
          </xsl:if>

          <!-- include the member options dropdown on memberlist topics -->
          <xsl:if test="boolean($showMemberOptionsFilter)">
            <xsl:call-template name="memberOptionsDropdown"/>
          </xsl:if>

          <!-- include the member platforms dropdown on memberlist topics that have platform info -->
          <xsl:if test="boolean($showMemberFrameworksFilter)">
            <xsl:call-template name="memberFrameworksDropdown"/>
          </xsl:if>
        </td>
      </tr>
    </table>
    <xsl:if test="boolean($showDevlangsFilter)">
      <xsl:call-template name="devlangsMenu"/>
    </xsl:if>

    <!-- include the member options dropdown on memberlist topics -->
    <xsl:if test="boolean($showMemberOptionsFilter)">
      <xsl:call-template name="memberOptionsMenu"/>
    </xsl:if>

    <!-- include the member platforms dropdown on memberlist topics that have platform info -->
    <xsl:if test="boolean($showMemberFrameworksFilter)">
      <xsl:call-template name="memberFrameworksMenu"/>
    </xsl:if>
  </xsl:template>

  <xsl:template name="FrameworksMenuCheckbox">
    <xsl:variable name="versionName" select="@name"/>
    <!-- checkbox for each version group -->
    <input id="{$versionName}Checkbox" type='checkbox' data="{$versionName},'persist'" value="on" onClick="SetMemberFrameworks(this)"/>
    <label class="checkboxLabel" for="{$versionName}Checkbox">
      <include item="Include{$versionName}Members"/>
    </label>
    <br/>
  </xsl:template>

  <!-- /document/reference/elements/element/versions/versions -->
  <xsl:template name="memberFrameworksMenu">
    <div id="memberFrameworksMenu">
      <xsl:for-each select="/document/reference/elements//element/versions[versions]">
        <xsl:if test="position()=1">
          <xsl:for-each select="versions">
            <xsl:call-template name="FrameworksMenuCheckbox"/>
          </xsl:for-each>
        </xsl:if>
      </xsl:for-each>
      <xsl:text> </xsl:text>
    </div>
  </xsl:template>

  <xsl:template name="memberFrameworksDropdown">
    <include item="dropdownSeparator"/>
    <span id="memberFrameworksDropdown" class="filter" tabindex="0">
      <img id="memberFrameworksDropdownImage">
        <includeAttribute name="src" item="iconPath">
          <parameter>dropdown.gif</parameter>
        </includeAttribute>
      </img>
      <xsl:text>&#xa0;</xsl:text>
      <label id="memberFrameworksMenuAllLabel" for="memberFrameworksDropdownImage" style="display: none;">
        <nobr>
          <include item="memberFrameworksShowAll"/>
          <xsl:text>&#160;</xsl:text>
        </nobr>
      </label>
      <label id="memberFrameworksMenuMultipleLabel" for="memberFrameworksDropdownImage" style="display: none;">
        <nobr>
          <include item="memberFrameworksMultiple"/>
          <xsl:text>&#160;</xsl:text>
        </nobr>
      </label>
      <xsl:for-each select="/document/reference/elements//element/versions[versions]">
        <xsl:if test="position()=1">
          <xsl:for-each select="versions">
            <xsl:variable name="versionName" select="@name"/>
            <label id="memberFrameworksMenu{$versionName}Label" for="memberFrameworksDropdownImage" style="display: none;">
              <nobr>
                <include item="memberFrameworks{$versionName}"/>
                <xsl:text>&#160;</xsl:text>
              </nobr>
            </label>
          </xsl:for-each>
        </xsl:if>
      </xsl:for-each>
    </span>
  </xsl:template>

  <!--  -->
  <xsl:variable name="moreMemberOptions" select="false()"/>

  <xsl:template name="memberOptionsMenu">
    <div id="memberOptionsMenu">
      <xsl:if test="$moreMemberOptions">
        <input id="PublicCheckbox" type='checkbox' data="Public" value="on" onClick="SetMemberOptions(this, 'vis')"/>
        <label class="checkboxLabel" for="PublicCheckbox">
          <include item="includePublicMembers"/>
        </label>
        <br/>
      </xsl:if>
      <input id="ProtectedCheckbox" type='checkbox' data="Protected" value="on" onClick="SetMemberOptions(this, 'vis')"/>
      <label class="checkboxLabel" for="ProtectedCheckbox">
        <include item="includeProtectedMembers"/>
      </label>
      <br/>
      <xsl:if test="$moreMemberOptions">
        <br/>
        <input id="DeclaredCheckbox" type='checkbox' data="Declared" value="on" onClick="SetMemberOptions(this, 'decl')"/>
        <label class="checkboxLabel" for="DeclaredCheckbox">
          <include item="includeDeclaredMembers"/>
        </label>
        <br/>
      </xsl:if>
      <input id="InheritedCheckbox" type='checkbox' data="Inherited" value="on" onClick="SetMemberOptions(this, 'decl')"/>
      <label class="checkboxLabel" for="InheritedCheckbox">
        <include item="includeInheritedMembers"/>
      </label>
      <br/>
    </div>
  </xsl:template>

  <xsl:template name="memberOptionsDropdown">
    <include item="dropdownSeparator"/>
    <span id="memberOptionsDropdown" class="filter" tabindex="0">
      <img id="memberOptionsDropdownImage">
        <includeAttribute name="src" item="iconPath">
          <parameter>dropdown.gif</parameter>
        </includeAttribute>
      </img>
      <xsl:text>&#xa0;</xsl:text>
      <label id="memberOptionsMenuAllLabel" for="memberOptionsDropdownImage" style="display: none;">
        <nobr>
          <include item="memberOptionsShowAll"/>
          <xsl:text>&#160;</xsl:text>
        </nobr>
      </label>
      <label id="memberOptionsMenuMultipleLabel" for="memberOptionsDropdownImage" style="display: none;">
        <nobr>
          <include item="memberOptionsFiltered"/>
          <xsl:text>&#160;</xsl:text>
        </nobr>
      </label>
      <label id="memberOptionsMenuProtectedLabel" for="memberOptionsDropdownImage" style="display: none;">
        <nobr>
          <include item="memberOptionsFiltered"/>
          <xsl:text>&#160;</xsl:text>
        </nobr>
      </label>
      <label id="memberOptionsMenuInheritedLabel" for="memberOptionsDropdownImage" style="display: none;">
        <nobr>
          <include item="memberOptionsFiltered"/>
          <xsl:text>&#160;</xsl:text>
        </nobr>
      </label>
      <xsl:if test="$moreMemberOptions">
        <label id="memberOptionsMenuPublicLabel" for="memberOptionsDropdownImage" style="display: none;">
          <nobr>
            <include item="memberOptionsFiltered"/>
            <xsl:text>&#160;</xsl:text>
          </nobr>
        </label>
        <label id="memberOptionsMenuDeclaredLabel" for="memberOptionsDropdownImage" style="display: none;">
          <nobr>
            <include item="memberOptionsFiltered"/>
            <xsl:text>&#160;</xsl:text>
          </nobr>
        </label>
      </xsl:if>
    </span>
  </xsl:template>

  <xsl:template name="devlangsDropdown">
    <!-- if only one language, omit the dropdown -->
    <xsl:if test="(count($languages/language) &gt; 1)">
      <include item="dropdownSeparator"/>
      <span id="devlangsDropdown" class="filter" tabindex="0">
        <img id="devlangsDropdownImage">
          <includeAttribute name="src" item="iconPath">
            <parameter>dropdown.gif</parameter>
          </includeAttribute>
        </img>
        <xsl:text>&#xa0;</xsl:text>
        <label id="devlangsMenuAllLabel" for="devlangsDropdownImage" style="display: none;">
          <nobr>
            <include item="devlangsDropdown">
              <parameter>
                <include item="all"/>
              </parameter>
            </include>
            <xsl:text>&#160;</xsl:text>
          </nobr>
        </label>
        <label id="devlangsMenuMultipleLabel" for="devlangsDropdownImage" style="display: none;">
          <nobr>
            <include item="devlangsDropdown">
              <parameter>
                <include item="multiple"/>
              </parameter>
            </include>
            <xsl:text>&#160;</xsl:text>
          </nobr>
        </label>
        <xsl:for-each select="$languages/language">
          <label id="devlangsMenu{@name}Label" for="devlangsDropdownImage" style="display: none;">
            <nobr>
              <include item="devlangsDropdown">
                <parameter>
                  <include item="{@name}"/>
                </parameter>
              </include>
              <xsl:text>&#160;</xsl:text>
            </nobr>
          </label>
        </xsl:for-each>
      </span>
    </xsl:if>
  </xsl:template>

  <xsl:template name="devlangsMenu">
    <div id="devlangsMenu">
      <xsl:for-each select="$languages/language">
        <input id="{@name}Checkbox" type='checkbox' data="{@name},{@style},'persist'" value="on" onClick="SetLanguage(this)"/>
        <label class="checkboxLabel" for="{@name}Checkbox">
          <include item="{@name}"/>
        </label>
        <br/>
      </xsl:for-each>
    </div>
  </xsl:template>



  <!-- image links 
current ndppick XSLT behavior:
expandAllImage - all
dropDownImage - not namespace or derivedTypeList
dropDownHoverImage -  not namespace or derivedTypeList
collapseImage - all
expandImage - all
collapseAllImage - all
copyImage - overview (not namespace); list (only overload lists ctor, method, prop)
copyHoverImage - overview (not namespace); list (only overload lists ctor, method, prop)
  -->
  <xsl:template name="commonImages">
    <img id="collapseImage" style="display:none; height:0; width:0;">
      <includeAttribute name="src" item="iconPath">
        <parameter>collapse_all.gif</parameter>
      </includeAttribute>
      <includeAttribute name="title" item="collapseImage" />
    </img>
    <img id="expandImage" style="display:none; height:0; width:0;">
      <includeAttribute name="src" item="iconPath">
        <parameter>expand_all.gif</parameter>
      </includeAttribute>
      <includeAttribute name="title" item="expandImage" />
    </img>
    <img id="collapseAllImage" style="display:none; height:0; width:0;">
      <includeAttribute name="src" item="iconPath">
        <parameter>collapse_all.gif</parameter>
      </includeAttribute>
    </img>
    <img id="expandAllImage" style="display:none; height:0; width:0;">
      <includeAttribute name="src" item="iconPath">
        <parameter>expand_all.gif</parameter>
      </includeAttribute>
    </img>
    <img id="dropDownImage" style="display:none; height:0; width:0;">
      <includeAttribute name="src" item="iconPath">
        <parameter>dropdown.gif</parameter>
      </includeAttribute>
    </img>
    <img id="dropDownHoverImage" style="display:none; height:0; width:0;">
      <includeAttribute name="src" item="iconPath">
        <parameter>dropdownHover.gif</parameter>
      </includeAttribute>
    </img>
    <img id="copyImage" style="display:none; height:0; width:0;">
      <includeAttribute name="src" item="iconPath">
        <parameter>copycode.gif</parameter>
      </includeAttribute>
      <includeAttribute name="title" item="copyImage" />
    </img>
    <img id="copyHoverImage" style="display:none; height:0; width:0;">
      <includeAttribute name="src" item="iconPath">
        <parameter>copycodeHighlight.gif</parameter>
      </includeAttribute>
      <includeAttribute name="title" item="copyHoverImage" />
    </img>

  </xsl:template>


</xsl:stylesheet>