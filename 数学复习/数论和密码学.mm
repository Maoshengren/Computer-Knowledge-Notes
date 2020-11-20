<map version="freeplane 1.8.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="数论和密码学" FOLDED="false" ID="ID_625138117" CREATED="1604298619009" MODIFIED="1604302360575" STYLE="oval">
<font SIZE="18"/>
<hook NAME="MapStyle" zoom="1.21">
    <properties edgeColorConfiguration="#808080ff,#ff0000ff,#0000ffff,#00ff00ff,#ff00ffff,#00ffffff,#7c0000ff,#00007cff,#007c00ff,#7c007cff,#007c7cff,#7c7c00ff" fit_to_viewport="false"/>

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node" STYLE="oval" UNIFORM_SHAPE="true" VGAP_QUANTITY="24.0 pt">
<font SIZE="24"/>
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="default" ICON_SIZE="12.0 pt" COLOR="#000000" STYLE="fork">
<font NAME="SansSerif" SIZE="10" BOLD="false" ITALIC="false"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.details"/>
<stylenode LOCALIZED_TEXT="defaultstyle.attributes">
<font SIZE="9"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.note" COLOR="#000000" BACKGROUND_COLOR="#ffffff" TEXT_ALIGN="LEFT"/>
<stylenode LOCALIZED_TEXT="defaultstyle.floating">
<edge STYLE="hide_edge"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.user-defined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="styles.topic" COLOR="#18898b" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subtopic" COLOR="#cc3300" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subsubtopic" COLOR="#669900">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.important">
<icon BUILTIN="yes"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.AutomaticLayout" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="AutomaticLayout.level.root" COLOR="#000000" STYLE="oval" SHAPE_HORIZONTAL_MARGIN="10.0 pt" SHAPE_VERTICAL_MARGIN="10.0 pt">
<font SIZE="18"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,1" COLOR="#0033ff">
<font SIZE="16"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,2" COLOR="#00b439">
<font SIZE="14"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,3" COLOR="#990000">
<font SIZE="12"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,4" COLOR="#111111">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,5"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,6"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,7"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,8"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,9"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,10"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,11"/>
</stylenode>
</stylenode>
</map_styles>
</hook>
<hook NAME="AutomaticEdgeColor" COUNTER="0" RULE="FOR_LEVELS"/>
<hook NAME="accessories/plugins/AutomaticLayout.properties" VALUE="HEADINGS"/>
<node TEXT="整除和模算术" POSITION="right" ID="ID_1939925521" CREATED="1604298932854" MODIFIED="1604487631454" COLOR="#3333ff" TEXT_ALIGN="CENTER">
<font SIZE="12"/>
<edge COLOR="#33ffff"/>
<node TEXT="模算术" ID="ID_341317084" CREATED="1604298953375" MODIFIED="1604299637588">
<node TEXT="如果a和b为整数而m为正整数，则当m整除a-b时称a模m同余b。" ID="ID_1204817195" CREATED="1604299057065" MODIFIED="1604300129698" FORMAT="latexPatternFormat"/>
<node TEXT="记为 a \equiv b(mod m)" ID="ID_662927290" CREATED="1604299210605" MODIFIED="1604299631550" FORMAT="latexPatternFormat" HGAP_QUANTITY="17.749999888241295 pt" VSHIFT_QUANTITY="7.499999776482589 pt"/>
<node TEXT="定理3： 上式成立当且仅当 a mod m = b mod m" LOCALIZED_STYLE_REF="default" ID="ID_750046213" CREATED="1604299383975" MODIFIED="1604300300009" STYLE="fork" FORMAT="latexPatternFormat" HGAP_QUANTITY="17.749999888241295 pt" VSHIFT_QUANTITY="6.74999979883433 pt">
<font SIZE="10"/>
</node>
<node TEXT="定理4： 令m为正整数, a \equiv b当且仅当存在整数k使得a= b+ km" ID="ID_1972630116" CREATED="1604299465933" MODIFIED="1604299975682" FORMAT="latexPatternFormat" HGAP_QUANTITY="14.749999977648258 pt" VSHIFT_QUANTITY="11.249999664723884 pt"/>
<node TEXT="定理5： 若a=b(mod m), c=d(mod m),则a+c=b+d(mod m), ac=bd(mod m)" ID="ID_248189912" CREATED="1604299533765" MODIFIED="1604300825792" FORMAT="latexPatternFormat" HGAP_QUANTITY="14.749999977648258 pt" VSHIFT_QUANTITY="9.749999709427366 pt" MAX_WIDTH="15.0 cm"/>
<node TEXT="推论2：  (a+b)mod m = ((a mod m) + (b mod m)) mod m, 且ab mod m = ((a mod m)(b mod m))mod m" ID="ID_955102528" CREATED="1604299546442" MODIFIED="1604300839257" HGAP_QUANTITY="17.749999888241295 pt" VSHIFT_QUANTITY="11.249999664723884 pt" FORMAT="latexPatternFormat" MAX_WIDTH="20.0 cm"/>
</node>
</node>
<node TEXT="素数和最大公约数" POSITION="right" ID="ID_146584616" CREATED="1604298947538" MODIFIED="1604487641362" HGAP_QUANTITY="17.749999888241295 pt" VSHIFT_QUANTITY="2.249999932944778 pt" BACKGROUND_COLOR="#ffcccc">
<font SIZE="12"/>
<edge COLOR="#0000ff"/>
<node TEXT="" LOCALIZED_STYLE_REF="default" ID="ID_231102405" CREATED="1604300107663" MODIFIED="1604300527733" VSHIFT_QUANTITY="2.2499999329447764 pt">
<node TEXT="定理1：（算术基本定理 ） 每个大于1的整数都可以唯一地写为两个或多个素数的乘积，其中素数因子以非递减序排列。" ID="ID_1070614137" CREATED="1604300510182" MODIFIED="1604300849575" HGAP_QUANTITY="24.499999687075622 pt" VSHIFT_QUANTITY="-11.999999642372142 pt" FORMAT="STANDARD_FORMAT"/>
</node>
<node TEXT="试除法" ID="ID_1630013816" CREATED="1604300482757" MODIFIED="1604300756210">
<node TEXT="定理2：如果n是一个合数，那么n必有一个素因子小于或等于\sqrt n" ID="ID_1371582399" CREATED="1604300581409" MODIFIED="1604300756209" FORMAT="latexPatternFormat" HGAP_QUANTITY="13.250000022351742 pt" VSHIFT_QUANTITY="4.499999865889553 pt"/>
</node>
<node TEXT="" ID="ID_1493390113" CREATED="1604300738638" MODIFIED="1604300962744">
<node TEXT="定理3：存在无限个素数" ID="ID_328510106" CREATED="1604300740612" MODIFIED="1604300962744" HGAP_QUANTITY="43.2499991282821 pt" VSHIFT_QUANTITY="8.249999754130847 pt"/>
</node>
<node TEXT="最大公约数和最小公倍数" ID="ID_1976677217" CREATED="1604300943085" MODIFIED="1604300991318">
<node TEXT="" ID="ID_1394365197" CREATED="1604300958808" MODIFIED="1604300991318" HGAP_QUANTITY="19.999999821186073 pt" VSHIFT_QUANTITY="3.7499998882412946 pt">
<node TEXT="令a和b 是两个整数，不全为0， 能使d | a和d | b的最大整数d称为a和b的最大公约数，a和b的最大公约数记作gcd(a, b)。" ID="ID_1856808626" CREATED="1604300992486" MODIFIED="1604301138255" MAX_WIDTH="20.0 cm" FORMAT="latexPatternFormat"/>
<node TEXT="" ID="ID_692076003" CREATED="1604301028982" MODIFIED="1604301028982">
<node TEXT="正整数a和b的最小公倍数是能被a和b整除的最小正整数。a和b的最小公倍数记作lcm(a, .b)。" ID="ID_1871424756" CREATED="1604301089763" MODIFIED="1604301148583" MAX_WIDTH="20.0 cm"/>
<node TEXT="gcd(a,b) = sa + tb, s,t称为贝祖系数" ID="ID_203622133" CREATED="1604301162885" MODIFIED="1604302160954"/>
</node>
<node TEXT="" ID="ID_379290301" CREATED="1604302116993" MODIFIED="1604302116993"/>
</node>
</node>
</node>
<node TEXT="求解同余方程" LOCALIZED_STYLE_REF="AutomaticLayout.level,1" POSITION="right" ID="ID_1121371868" CREATED="1604302332245" MODIFIED="1604302397853" HGAP_QUANTITY="22.999999731779106 pt" VSHIFT_QUANTITY="38.99999883770946 pt">
<font SIZE="12"/>
<node TEXT="费马小定理" ID="ID_666865627" CREATED="1604302377849" MODIFIED="1604303915605">
<node TEXT="a是一个不能被p整除的整数， 则 a^{p-1} \equiv 1(mod p)" ID="ID_951436545" CREATED="1604303918647" MODIFIED="1604304400900" FORMAT="latexPatternFormat">
<icon BUILTIN="bookmark"/>
</node>
<node TEXT="" ID="ID_82557280" CREATED="1604304015177" MODIFIED="1604304015177"/>
</node>
</node>
</node>
</map>
