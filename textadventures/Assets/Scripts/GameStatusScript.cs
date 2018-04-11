using UnityEngine;
using System.Collections;
using System.IO;
using JsonFx.Json;
using UnityEngine.UI;

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
	public Image quitView;
	public Image scrollView;
	public Text gameViewTitle;
	public Text gameViewText;
	public Text gameViewHeroStatusText;
	public Button[] buttons;
	public Image[] pictures;
	private Logic logic = null;

	public Image front;
	
	public static void trackEvent(string category, string action) {

	}
	
	private static void resetDraggablePanelPosition (Transform view)
	{

	}
	
	void procced ()
	{
		if (logic != null) {
			if (logic.currentItemIndex > -1 && logic.currentItemIndex < logic.items.Length) {
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

				for (int i = 0; i < buttons.Length; i++) {
					buttons [i].gameObject.SetActive(false);
				}
				
				for (int i = 0; i < item.buttonsTexts.Length; i++) {
					if (i < buttons.Length) {
						Button bs = buttons [i];
						bs.transform.Find("Text").GetComponent<Text>().text = item.buttonsTexts [i];
						buttons [i].enabled = item.goIndexes [i] != -1;
						buttons [i].gameObject.SetActive(item.goIndexes [i] != -1);
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
				
					if (buttons [buttons.Length - 1].enabled) {
						buttons [buttons.Length - 1].gameObject.SetActive(conditionOk);
					}
				}
				
				if (item.picturesSpriteNames != null) {
					for (int i = 0; i < item.picturesSpriteNames.Length; i++) {
						if (i < pictures.Length) {
							//pictures [i].sprite.name = item.picturesSpriteNames [i];
						
							pictures [i].gameObject.SetActive (!item.picturesSpriteNames [i].Equals (string.Empty));
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

	public void openPressed() {
		front.gameObject.SetActive(false);
	}
	
	public void buttonPressed (GameObject button)
	{
		if (logic.pleaseRestart) {
			load ();
			procced ();
			return;
		}
		
		int i = 0;
		foreach (Button b in buttons) {
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
			quitView.gameObject.SetActive(true);
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
		var textAsset = Resources.Load ("Data/FateCookies") as TextAsset;
		logic = JsonReader.Deserialize<Logic> (textAsset.text);
		
		trackEvent("Book", "Loaded");     
	}
	
	string text;
	
	public void printText ()
	{
		gameViewText.text = text;
	}
}
