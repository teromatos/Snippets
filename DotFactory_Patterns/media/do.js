//<![CDATA[
// Topic
function OnToggleTopicComplete(result)
{
    if (!result["alertMessage"])  // test for null, undefined, and false
        $get(result["toggleImage"]).src = result["toggleImageValue"];
    else
        alert(result["alertMessage"]);
}

// Post
function OnTogglePostComplete(result)
{
    if (!result["alertMessage"])
        $get(result["toggleImage"]).src = result["toggleImageValue"];
    else
        alert(result["alertMessage"]);
}

// User
function OnToggleUserComplete(result)
{
    if (!result["alertMessage"])
        $get(result["toggleImage"]).src = result["toggleImageValue"];
    else
        alert(result["alertMessage"]);
}

// Answer

function OnAnswerComplete(result)
{
    if (!result["alertMessage"])
        $get(result["toggleImage"]).src = result["toggleImageValue"];
    else
        alert(result["alertMessage"]);
}

// Comments

function OnCommentComplete(result)
{
    if (!result["alertMessage"])
    {
        $get(result["panelAddComment"]).style.display = 'block';
        $get(result["panelEditComment"]).style.display = 'none';
        $get(result["labelComments"]).innerHTML = result["html"];
    }
    else
        alert(result["alertMessage"]);
}

function ConfirmDeleteComment(id, thing, thingId, label)
{
    if (!confirm('Are you sure you want to delete your comment?')) return false;
    DoFactory.DoFactoryWebService.DeleteComment(id, thing, thingId, label, OnCommentDeleteComplete);
}

function OnCommentDeleteComplete(result)
{
    $get(result["labelComments"]).innerHTML = result["html"];
}

function OnReviewComplete(result)
{
    if (!result["alertMessage"])
    {
        $get(result["labelThanks"]).innerHTML = 'Thanks'; // display yes
        $get(result["hyperlinkUpVote"]).style.display = 'none'; // display no
        $get(result["hyperlinkDownVote"]).style.display = 'none'; // display no
        $get(result["labelResult"]).innerHTML = result["labelResultText"]; // result
    }
    else
        alert(result["alertMessage"]);

}

function OpenWindow(url)
{
    window.open(url, 'ref' + Math.floor(Math.random() * 100));
}
//]]>
