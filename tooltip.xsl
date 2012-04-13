<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE stylesheet SYSTEM "wot.dtd">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:strip-space elements="*"/>

    <xsl:output encoding="utf-8" method="xml" omit-xml-declaration="yes" standalone="no"/>

    <xsl:variable name="icon-path-base-16" select="'assets/icons/16_16/plain/'"/>
    <xsl:variable name="icon-path-base-19" select="'assets/icons/19_19/'"/>

    <xsl:template match="query">
        <rows>
            <xsl:if test="count(./application[not(@error)]) = 0">
                <row xmlns="http://bar.yandex.ru/dev/gui">
                    <cell h-align="center" padding-top="5" xmlns="http://bar.yandex.ru/dev/gui">
                        <text>&wot.tooltip.nodata;</text>
                    </cell>
                </row>
            </xsl:if>
            <!-- process only apps without 'error' flag set -->
            <xsl:apply-templates select="./application[not(@error)]"/>
        </rows>
    </xsl:template>
    <!-- For each application produce grid rows for title and ratings values -->
    <xsl:template match="application">
        <xsl:apply-templates select="." mode="title"/>
        <xsl:apply-templates select="." mode="ratings"/>
    </xsl:template>

    <!-- Title of application -->
    <xsl:template match="application" mode="title">
        <row padding-top="3" padding-bottom="2" xmlns="http://bar.yandex.ru/dev/gui">
            <cell>
                <text>
                    <xsl:choose>
                        <xsl:when test="@name=0">
                            <!-- Trustworthiness -->
                            <xsl:text>Заслуживает доверие</xsl:text>
                        </xsl:when>
                        <xsl:when test="@name=1">
                            <!-- Vendor reliability -->
                            <xsl:text>Надежность продавца</xsl:text>
                        </xsl:when>
                        <xsl:when test="@name=2">
                            <!-- Privacy -->
                            <xsl:text>Конфиденциальность</xsl:text>
                        </xsl:when>
                        <xsl:when test="@name=4">
                            <!-- Child Safety -->
                            <xsl:text>Безопасность для детей</xsl:text>
                        </xsl:when>
                    </xsl:choose>
                </text>
            </cell>
            <cell merge-left="true"/>
        </row>
    </xsl:template>

    <xsl:template match="application" mode="ratings">
        <row xmlns="http://bar.yandex.ru/dev/gui">
            <cell width="24" max-width="24">
                <icon>
                    <xsl:call-template name="reputation-icon">
                        <xsl:with-param name="reputation" select="@r"/>
                    </xsl:call-template>
                </icon>
            </cell>
            <cell>
                <icon>
                    <xsl:call-template name="confidence-icon">
                        <xsl:with-param name="conf-level" select="@c"/>
                    </xsl:call-template>
                </icon>
            </cell>
        </row>
    </xsl:template>

    <xsl:template name="reputation-icon">
        <xsl:param name="reputation"/>
        <xsl:choose>
            <xsl:when test="$reputation &gt;= 0 and $reputation &lt; 20">
                <xsl:value-of select="$icon-path-base-19"/>
                <xsl:text>r1.png</xsl:text>
            </xsl:when>
            <xsl:when test="$reputation &gt;= 20 and $reputation &lt; 40">
                <xsl:value-of select="$icon-path-base-19"/>
                <xsl:text>r2.png</xsl:text>
            </xsl:when>
            <xsl:when test="$reputation &gt;= 40 and $reputation &lt; 60">
                <xsl:value-of select="$icon-path-base-19"/>
                <xsl:text>r3.png</xsl:text>
            </xsl:when>
            <xsl:when test="$reputation &gt;= 60 and $reputation &lt; 80">
                <xsl:value-of select="$icon-path-base-19"/>
                <xsl:text>r4.png</xsl:text>
            </xsl:when>
            <xsl:when test="$reputation &gt;= 80">
                <xsl:value-of select="$icon-path-base-19"/>
                <xsl:text>r5.png</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$icon-path-base-19"/>
                <xsl:text>r0.png</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="confidence-icon">
        <xsl:param name="conf-level"/>
        <xsl:choose>
            <xsl:when test="$conf-level &gt;= 0 and $conf-level &lt; 6">
                <xsl:value-of select="$icon-path-base-19"/>
                <xsl:text>confidence-0.png</xsl:text>
            </xsl:when>
            <xsl:when test="$conf-level &gt;= 6 and $conf-level &lt; 12">
                <xsl:value-of select="$icon-path-base-19"/>
                <xsl:text>confidence-1.png</xsl:text>
            </xsl:when>
            <xsl:when test="$conf-level &gt;= 12 and $conf-level &lt; 23">
                <xsl:value-of select="$icon-path-base-19"/>
                <xsl:text>confidence-2.png</xsl:text>
            </xsl:when>
            <xsl:when test="$conf-level &gt;= 23 and $conf-level &lt; 34">
                <xsl:value-of select="$icon-path-base-19"/>
                <xsl:text>confidence-3.png</xsl:text>
            </xsl:when>
            <xsl:when test="$conf-level &gt;= 34 and $conf-level &lt; 45">
                <xsl:value-of select="$icon-path-base-19"/>
                <xsl:text>confidence-4.png</xsl:text>
            </xsl:when>
            <xsl:when test="$conf-level &gt;= 45">
                <xsl:value-of select="$icon-path-base-19"/>
                <xsl:text>confidence-5.png</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$icon-path-base-19"/>
                <xsl:text>confidence-0.png</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
