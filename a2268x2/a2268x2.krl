ruleset a2268x2 {
meta {
name "ALD Hello World"
description <<
my first try
>>
author "Andy Dale"
// Uncomment this line to require Marketplace purchase to use this app.
// authz require user
logging off


use module a169x701 alias CloudRain
}

dispatch {
// Some example dispatch domains
// domain "example.com"
// domain "other.example.com"
}


global{

}

rule example_html_response {
select when andy_event example_html
pre {
example_html = <<
<div id = "blockity-block">Block elements are awesome!</div>
<span id = "inliny-line">Inline elements are cool too!</span>
>>;
}
{
send_raw("text/html")
with content = example_html;
}
}


rule HelloWorld
{
select when web cloudAppSelected
pre{

pageProtocol = page:url("protocol");
queryStr = page:url("path");

my_html= <<

<div style="margin: 0px 0px 20px 20px">
The page protocol is #{pageProtocol}
<br><br>
QS = #{queryStr}<br><br>


g_var = #{g_var};

</div>

>>;
}

{
CloudRain:createLoadPanel("info for andy", {}, my_html);
}


}



}