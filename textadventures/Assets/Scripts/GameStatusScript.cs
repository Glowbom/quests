using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using JsonFx.Json;
using UnityEngine.UI;
using UnityEngine.Advertisements;

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

	public GameObject about;
	
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
							if (sprites.ContainsKey(item.picturesSpriteNames [i])) {
								pictures [i].sprite = sprites[item.picturesSpriteNames [i]];
							}			
							pictures [i].gameObject.SetActive (!item.picturesSpriteNames [i].Equals (string.Empty));
						}
					}
				}
				
			} 
		}
	} 

#if UNITY_IOS
private string gameId = "";
#elif UNITY_ANDROID
private string gameId = "";
#endif

	Dictionary<string, Sprite> sprites = new Dictionary<string, Sprite>();

	// Use this for initialization
	void Start ()
	{	
		load ();
		procced ();
		Advertisement.Initialize(gameId);

		sprites.Clear();
		Sprite sprite = Resources.Load("Textures/default", typeof(Sprite)) as Sprite;
		sprites.Add("default", sprite);

		string key = "sd1";
		sprite = Resources.Load("Textures/" + key, typeof(Sprite)) as Sprite;
		sprites.Add(key, sprite);

		key = "sd2";
		sprite = Resources.Load("Textures/" + key, typeof(Sprite)) as Sprite;
		sprites.Add(key, sprite);

		key = "sd3";
		sprite = Resources.Load("Textures/" + key, typeof(Sprite)) as Sprite;
		sprites.Add(key, sprite);
		sprites.Add("IconPromotionPR", sprite);

		key = "sf1";
		sprite = Resources.Load("Textures/" + key, typeof(Sprite)) as Sprite;
		sprites.Add(key, sprite);

		key = "sf2";
		sprite = Resources.Load("Textures/" + key, typeof(Sprite)) as Sprite;
		sprites.Add(key, sprite);

		key = "sf3";
		sprite = Resources.Load("Textures/" + key, typeof(Sprite)) as Sprite;
		sprites.Add(key, sprite);

		key = "sf4";
		sprite = Resources.Load("Textures/" + key, typeof(Sprite)) as Sprite;
		sprites.Add(key, sprite);

		key = "sa";
		sprite = Resources.Load("Textures/" + key, typeof(Sprite)) as Sprite;
		sprites.Add(key, sprite);


		key = "end";
		sprite = Resources.Load("Textures/" + key, typeof(Sprite)) as Sprite;
		sprites.Add(key, sprite);

		key = "afterend";
		sprite = Resources.Load("Textures/" + key, typeof(Sprite)) as Sprite;
		sprites.Add(key, sprite);

		key = "deadend";
		sprite = Resources.Load("Textures/" + key, typeof(Sprite)) as Sprite;
		sprites.Add(key, sprite);

		key = "ph";
		sprite = Resources.Load("Textures/" + key, typeof(Sprite)) as Sprite;
		sprites.Add(key, sprite);
	}

	public void aboutPressed() {
		about.SetActive(true);
	}

	public void aboutBackPressed() {
		about.SetActive(false);
	}

	public void openGlowbomLink() {
		Application.OpenURL("https://glowbom.com/");
	}

	public void openAboutLink() {
		Application.OpenURL("https://photos.icons8.com/half-eaten-oatmel-cookie-5a8bf2a08b658800019f1d7a");
	}

	public void openPressed() {
		front.gameObject.SetActive(false);
	}

	private int buttonPressedCounter = 0;
	
	public void buttonPressed (GameObject button)
	{
		++buttonPressedCounter;
		if (buttonPressedCounter % 17 == 0) {
			Advertisement.Show();
		}

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
		var textAsset = Resources.Load ("Data/FortuneCookie") as TextAsset;
		logic = JsonReader.Deserialize<Logic> (textAsset.text);
		
		trackEvent("Book", "Loaded");     
	}
	
	string text;
	
	public void printText ()
	{
		gameViewText.text = text;
	}

	// about
	// icon https://photos.icons8.com/half-eaten-oatmel-cookie-5a8bf2a08b658800019f1d7a
}
