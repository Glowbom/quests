// Java code for sharing
public class AndroidSharing {
    public void share(string message, string url) {
        Intent sendIntent = new Intent();
        sendIntent.setAction(Intent.ACTION_SEND);
        sendIntent.putExtra(android.content.Intent.EXTRA_SUBJECT, "");
        sendIntent.putExtra(Intent.EXTRA_TEXT, message + " " + url);
        sendIntent.setType("text/plain");
        startActivity(Intent.createChooser(sendIntent, "Share Via"));
    }
}
