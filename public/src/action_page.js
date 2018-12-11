function Getstats()
{
window.status=('Attempting to Login to user area.')

var AccId;
var iName;
AccId = document.iAccInput.iAccID.value
iName = document.iAccInput.iName.value

if (AccId == "" || iName == "")
{
alert('\nERROR\nYou must enter ALL Details,\nto View your statistics.\n');
window.status=('Missing data or Invalid. Check spelling and Ensure Names are in Correct Case.')
}
else
{
var location = '';
if (iName=='love' && CryptoJS.SHA1(AccId)=='9d989e8d27dc9e0ec3389fc855f142c3d40f0c50') {
    location=("page1.html");
}
else if (iName=='mom' && AccId=='love') {
    location=("page2.html");
}
else alert('Wrong pair');

this.location.href = location;
window.status=(' Verifying: ' + iName +' Please wait........');
}
}
