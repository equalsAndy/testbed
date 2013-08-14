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

    thisRID = meta:rid();   
    thisECI = meta:eci();

  main_text= <<Andy Dale>>;

}

rule example_html_response {
select when equalsAndy cloudPage
pre {
example_html = <<

<div  style="text-align:center;width:600px;">
<h3> Welcome to my Cloud Page </h3>

<h1> #{main_text} </h1>

<div id = "blockity-block" style="text-align:center;" >

   <img src='https://fbcdn-profile-a.akamaihd.net/hprofile-ak-ash3/c53.53.669.669/s160x160/533683_10151334029941507_1664954485_n.jpg' >

</div>
<br><br><br>

<span id = "inliny-line">This is the first cloud page in the world</span>
</div>

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

cp_link=<< https://cs.kobj.net/sky/event/#{thisECI}/112233/equalsAndy/cloudPage/ >>;

my_html= <<

<script>
function open_win()
{
window.open("#{cp_link}","_blank","toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes, width=600, height=600");
}
</script>

<div style="margin: 0px 0px 20px 20px">
    

    <fieldset>
              <h3>How do you want your cloud page to look?</h3>
          
              <div class="control-group">
                <label class="control-label" for="myBackgroundPhotoPreview">Select your profile picture</label>
                <div class="controls">
                  <img id="myBackgroundPhoto-preview" src="https://fbcdn-profile-a.akamaihd.net/hprofile-ak-ash3/c53.53.669.669/s160x160/533683_10151334029941507_1664954485_n.jpg" class="mycloud-photo-preview" alt="">
                </div>
              </div>
              <div class="control-group">
                <label class="control-label" for="myBackgroundPhoto"></label>
                <div class="controls form-search">
                  <input type="file" id="myBackgroundPhoto-file" elid="myBackgroundPhoto" onchange="KOBJ.a41x173.loadPhotoPreview(this)" style="position: fixed; top: -100px; left: -100px;">
                  <input type="hidden" id="myBackgroundPhoto" name="myBackgroundPhoto" value="https://squaretag.com/assets/img/bg/grey_wash_wall.png">
                <button type="button" class="btn "><i class="icon-folder-open"></i> Choose file</button></div>
              </div>
              <div class="control-group">
                <label class="control-label" for="myBackgroundPosition">Picture Allignment</label>
                <div class="controls">
                  <select name="myBackgroundType">
                    <option value="left">Left</option>
                    <option value="center"  selected="center">Center</option>
                    <option value="right">Right</option>
                  </select>
                </div>
              </div>
                 Main welcome text: <input type=text id='main_text' value="#{main_text}" ><br><br>

    Sub welcome text:  <input type=text id='sub_text' value="This is the first cloud page in the world!" ><br><br>


              
              <div class="form-actions">
                <button type="submit" class="btn btn-primary">Save Changes</button>
              </div>
            </fieldset>

    <div  class="form-actions" style='border:1px;color:black'>
        This is the link to your cloud page: <br>
            <div  style='border:1px;color:black'>
             #{cp_link} <input type='button' value='GO' onclick="open_win()">
            </div>
    </div>
</div>

>>;
}

{
CloudRain:createLoadPanel("Cloud Page Configuration", {}, my_html);
}


}



}