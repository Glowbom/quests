using UnityEngine;
using System.Collections;
using System.IO;
using JsonFx.Json;

public class Logic
{
	public class Item
	{
		public string title;
		public string description;
		public string[] buttonsTexts;
		public string[] picturesSpriteNames;
		public int[] goIndexes;
		public int[] goConditions;
		public int[] heroValues;
	}
	
	public string[] heroElements;
	public int[] heroValues;
	public int currentItemIndex = 0;
	public Item[] items;
	public int deadValue;
	public int deadLevel;
	public int deadItemIndex;
	public bool pleaseRestart = false;
	
	public Item nextItem (int i)
	{
		
		Item item = items [currentItemIndex];
		if (i > -1 && i < item.goIndexes.Length) {
			currentItemIndex = item.goIndexes [i];
			
			Item nextItem = items [currentItemIndex];
			
			if (nextItem.heroValues != null) {
				for (int j = 0; j < nextItem.heroValues.Length; j++) {
					heroValues [j] += nextItem.heroValues [j];
				}
			}
			
			if (deadValue > -1 && deadValue < heroValues.Length) {
				if (heroValues [deadValue] <= deadLevel) {
					currentItemIndex = deadItemIndex;
					nextItem = items [currentItemIndex];
					pleaseRestart = true;
				}
			}
			
			return nextItem;
		}
		
		return null;
	}
}

public class GameStatusScript : MonoBehaviour
{
	public UIPanel quitView;
	public UIPanel scrollView;
	public UILabel gameViewTitle;
	public UILabel gameViewText;
	public UILabel gameViewHeroStatusText;
	public UIButton[] buttons;
	public UISprite[] pictures;
	private Logic logic = null;
	
	public static void trackEvent(string category, string action) {
	    if (GoogleAnalytics.instance == null)
	    {
            return;
	    }
	    GAEvent myEvent = new GAEvent(category, action);
		GoogleAnalytics.instance.Add(myEvent);
		GoogleAnalytics.instance.Dispatch();
	}
	
	private static void resetDraggablePanelPosition (Transform view)
	{
		UIDraggablePanel panel = view.GetComponentInChildren<UIDraggablePanel> ();
		UIPanel p = panel.gameObject.GetComponent<UIPanel> ();
		Vector4 v4 = p.clipRange;
		panel.ResetPosition ();
		p.clipRange = new Vector4 (v4.x, p.clipRange.y, v4.z, v4.w);
	}
	
	void procced ()
	{
		if (logic != null) {
			if (logic.currentItemIndex > -1 && logic.currentItemIndex < logic.items.Length) {
				AdMobAndroid.hideBanner( false );
				resetDraggablePanelPosition(scrollView.gameObject.transform);
				
				Logic.Item item = logic.items [logic.currentItemIndex];
				gameViewTitle.text = item.title;
				
				//trackEvent("Book", item.title);
				
				string statusString = "";
				int index = 0;
				
				if (logic.heroElements != null) {
					foreach (string key in logic.heroElements) {
						statusString += string.Format ("{0} = {1},  ", key, logic.heroValues [index]);
						++index;
					}
				}
				
				if (statusString.Length > 2) {
					statusString = statusString.Remove (statusString.Length - 2, 2);
				}
				
				gameViewHeroStatusText.text = statusString;
				
				gameViewText.text = item.description;
				
				for (int i = 0; i < item.buttonsTexts.Length; i++) {
					if (i < buttons.Length) {
						ButtonScript bs = buttons [i].GetComponent<ButtonScript> ();
						bs.label.text = item.buttonsTexts [i];
						buttons [i].isEnabled = item.goIndexes [i] != -1;
						NGUITools.SetActive (buttons [i].gameObject, item.goIndexes [i] != -1);
					}
				}
				
				if (item.goConditions != null) {
					bool conditionOk = true;
					for (int i = 0; i < item.goConditions.Length; i++) {			
						if (item.goConditions [i] >= logic.heroValues [i]) {
							conditionOk = false;
							break;
						}
					}
				
					if (buttons [buttons.Length - 1].isEnabled) {
						NGUITools.SetActive (buttons [buttons.Length - 1].gameObject, conditionOk);
					}
				}
				
				if (item.picturesSpriteNames != null) {
					for (int i = 0; i < item.picturesSpriteNames.Length; i++) {
						if (i < pictures.Length) {
							pictures [i].spriteName = item.picturesSpriteNames [i];
						
							NGUITools.SetActive (pictures [i].gameObject, !item.picturesSpriteNames [i].Equals (string.Empty));
						}
					}
				}
				
			} 
		}
	} 

	// Use this for initialization
	void Start ()
	{	
		
		load ();
		
		procced ();
		
	}
	
	public void buttonPressed (GameObject button)
	{
		if (logic.pleaseRestart) {
			load ();
			procced ();
			return;
		}
		
		int i = 0;
		foreach (UIButton b in buttons) {
			if (b.gameObject == button) {
				logic.nextItem (i);
				procced ();
				break;
			}
			
			++i;
		}
	}
	
	// Update is called once per frame
	void Update ()
	{
		if (Input.GetKeyDown(KeyCode.Escape)) {
			NGUITools.SetActive(quitView.gameObject, true);
		}
	}
	
	public void save ()
	{
		try {
			using (StreamWriter sw = new StreamWriter ("Assets/Game.txt", false)) {
				sw.Write (JsonFx.Json.JsonWriter.Serialize (logic)); 
			}
		} catch (IOException) {
		}
	}
	
	public void load ()
	{
		var textAsset = Resources.Load ("Data/TextGameWeb") as TextAsset;
		logic = JsonReader.Deserialize<Logic> (textAsset.text);
		
		trackEvent("Book", "Loaded");
		
		//try {
		//	text = Application.dataPath + "/TextGameWeb.txt";
		//	printText ();
		//		using (StreamReader sr = new StreamReader (Application.dataPath + "/TextGameWeb.txt")) {
		//			logic = JsonReader.Deserialize<Logic> (sr.ReadToEnd ());
		//		}
		//	} catch (IOException e) {
		//		text = e.Message;
		//		Invoke ("printText", 2);
		//	}
		
		
		//string url = Application.dataPath + @"/TextGameWeb.txt";

		//WWW request = new WWW(url);

		//while(!request.isDone) {
		//}

		//logic = JsonReader.Deserialize<Logic> (request.data);        
	}
	
	string text;
	
	public void printText ()
	{
		gameViewText.text = text;
	}
}
