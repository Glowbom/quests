using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine.UI;

/*
 * Created on Sun Jul 21 2019
 *
 * Copyright (c) 2019 Glowbom.
 */
[System.Serializable]
public class Logic
{
	[System.Serializable]
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

public class Buttons {
	public class Button
	{
		public string name;
		public string link;
	}

	public Button[] buttons;
}

// networking

public class GridStatusScript : MonoBehaviour
{
	public GameObject editButtonPanel;
	public InputField editTitleButtonField;

	public GameObject editView;
	public InputField editTitleField;
	public InputField editTextField;
	public Image quitView;
	public Image scrollView;
	public Text gameViewTitle;
	public Text gameViewText;
	public Text gameViewHeroStatusText;
	public Button[] buttons;

	public Button[] gridButtons;
	public Image[] pictures;
	private Logic logic = null;

	public Text startButtonText;

	private Buttons buttonsLogic = null;

	public Image front;

	public Image gridBackground;

	public GameObject about;

	public GameObject gridButtonsPanel;

	// edit

	public Button[] editButtons;
	public Button[] editGotoButtons;

	// signup
	public GameObject signupView;

	public Text status;

	Dictionary<string, string> answers = new Dictionary<string, string>();
	
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

				

				if (item.description.Contains("[newline]")) {
					item.description = item.description.Replace("[newline]", "\n");	
				}

				if (item.description.Contains("{question")) {
					foreach(string key in answers.Keys) {
						//Debug.Log("key = " + key + "; value = " + answers[key]);
						if (item.description.Contains("{" + key + "}")) {
							item.description = item.description.Replace("{" + key + "}", answers[key]);	
						}
					}
				}

				for(int heroValueIndex = 0; heroValueIndex < logic.heroElements.Length; heroValueIndex++) {
					string element = logic.heroElements[heroValueIndex];
					if (item.description.Contains("{"+element)) {
						item.description = item.description.Replace("{" + element + "}", logic.heroValues[heroValueIndex].ToString());
					}
				}
				
				gameViewText.text = item.description;

				for (int i = 0; i < buttons.Length; i++) {
					buttons [i].gameObject.SetActive(false);
					editButtons[i].gameObject.SetActive(false);
				}
				
				for (int i = 0; i < item.buttonsTexts.Length; i++) {
					if (i < buttons.Length) {
						Button bs = buttons [i];
						if (item.buttonsTexts [i].Contains("{question")) {
							foreach(string key in answers.Keys) {
								if (item.buttonsTexts [i].Contains("{" + key + "}")) {
									item.buttonsTexts [i] = item.buttonsTexts [i].Replace("{" + key + "}", answers[key]);	
								}
							}
						}

						for(int heroValueIndex = 0; heroValueIndex < logic.heroElements.Length; heroValueIndex++) {
							string element = logic.heroElements[heroValueIndex];
							if (item.buttonsTexts [i].Contains("{"+element)) {
								item.buttonsTexts [i] = item.buttonsTexts [i].Replace("{" + element + "}", logic.heroValues[heroValueIndex].ToString());
							}
						}

						bs.transform.Find("Text").GetComponent<Text>().text = item.buttonsTexts [i];
						editButtons[i].transform.Find("Text").GetComponent<Text>().text = item.buttonsTexts [i];

						buttons [i].enabled = item.goIndexes [i] != -1;
						buttons [i].gameObject.SetActive(item.goIndexes [i] != -1);
						editButtons [i].enabled = item.goIndexes [i] != -1;
						editButtons [i].gameObject.SetActive(item.goIndexes [i] != -1);
					}
				}

				if (editButtons.Length > item.buttonsTexts.Length) {
					editButtons[item.buttonsTexts.Length].transform.Find("Text").GetComponent<Text>().text = "Add New";
					editButtons [item.buttonsTexts.Length].enabled = true;
					editButtons [item.buttonsTexts.Length].gameObject.SetActive(true);
				}
				
				if (item.goConditions != null && item.goConditions.Length > 0) {
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

	Dictionary<string, Sprite> sprites = new Dictionary<string, Sprite>();

	// Use this for initialization
	void Start ()
	{	
		GameStatusMagic.instance.load();
		startButtonText.text = GameStatusMagic.instance.questAnswers.Count == 0 ? "Create Quest" : "Edit Quest";  

		load ();
		loadButtonsLogic();
		procced ();

		sprites.Clear();
		Sprite sprite = Resources.Load("Textures/default", typeof(Sprite)) as Sprite;
		sprites.Add("default", sprite);

		string key = "sd1";
		sprite = Resources.Load("Textures/default", typeof(Sprite)) as Sprite;
		sprites.Add(key, sprite);

		key = "sd2";
		sprite = Resources.Load("Textures/default", typeof(Sprite)) as Sprite;
		sprites.Add(key, sprite);

		key = "sd3";
		sprite = Resources.Load("Textures/default", typeof(Sprite)) as Sprite;
		sprites.Add(key, sprite);
		sprites.Add("IconPromotionPR", sprite);

		key = "sf1";
		sprite = Resources.Load("Textures/default", typeof(Sprite)) as Sprite;
		sprites.Add(key, sprite);

		key = "sf2";
		sprite = Resources.Load("Textures/default", typeof(Sprite)) as Sprite;
		sprites.Add(key, sprite);

		key = "sf3";
		sprite = Resources.Load("Textures/default", typeof(Sprite)) as Sprite;
		sprites.Add(key, sprite);

		key = "sf4";
		sprite = Resources.Load("Textures/default", typeof(Sprite)) as Sprite;
		sprites.Add(key, sprite);

		key = "sa";
		sprite = Resources.Load("Textures/default", typeof(Sprite)) as Sprite;
		sprites.Add(key, sprite);


		key = "end";
		sprite = Resources.Load("Textures/default", typeof(Sprite)) as Sprite;
		sprites.Add(key, sprite);

		key = "afterend";
		sprite = Resources.Load("Textures/default", typeof(Sprite)) as Sprite;
		sprites.Add(key, sprite);

		key = "deadend";
		sprite = Resources.Load("Textures/default", typeof(Sprite)) as Sprite;
		sprites.Add(key, sprite);

		key = "ph";
		sprite = Resources.Load("Textures/default", typeof(Sprite)) as Sprite;
		sprites.Add(key, sprite);

		for (int i = 0; i < gridButtons.Length; i++) {
			gridButtons [i].gameObject.SetActive(false);
		}
				
				if (buttonsLogic != null && buttonsLogic.buttons != null) {
					for (int i = 0; i < buttonsLogic.buttons.Length; i++) {
			if (i < gridButtons.Length) {
					Button bs = gridButtons [i];
					bs.transform.Find("Text").GetComponent<Text>().text = buttonsLogic.buttons [i].name;
					gridButtons [i].gameObject.SetActive(true);
				}
			}
				}
		
	}

	public void backPressed() {
		front.gameObject.SetActive(true);
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
		
	}


	public void openPressed() {
		GameStatusMagic.instance.questAnswers.Clear();
		load();

		startButtonText.text = "Start Quest";

		front.gameObject.SetActive(false);
	}

	private int buttonPressedCounter = 0;

	private string lastClickedLink = null;

	public void buttonGridPressed (GameObject button) {
		int i = 0;
		foreach (Button b in gridButtons) {
			if (b.gameObject == button) {
				lastClickedLink = buttonsLogic.buttons[i].link;
				load();
				procced();
				
				//logic.nextItem (i);
				//procced ();
				break;
			}
			
			++i;
		}

		gridButtonsPanel.gameObject.SetActive(false);
		gridBackground.gameObject.SetActive(false);
	}

	public void backButtonMenuPressed(GameObject button) {
		front.gameObject.SetActive(true);
	}

	public void backButtonGamePressed(GameObject button) {
		gridButtonsPanel.gameObject.SetActive(true);
		gridBackground.gameObject.SetActive(true);
	}
	
	public void buttonPressed (GameObject button)
	{
		++buttonPressedCounter;
		if (buttonPressedCounter % 25 == 0) {
			//Advertisement.Show();
		}

		if (logic.pleaseRestart) {
			load ();
			procced ();
			return;
		}
		
		int i = 0;
		foreach (Button b in buttons) {
			if (b.gameObject == button) {

				string key = "question" + logic.currentItemIndex;
				string answer = logic.items [logic.currentItemIndex].buttonsTexts[i].ToLower();

				logic.nextItem (i);

				procced ();
				break;
			}
			
			++i;
		}

		int j = 0;
		foreach (Button b in editButtons) {
			if (b.gameObject == button) {
				editTitleButtonField.text = logic.items [logic.currentItemIndex].buttonsTexts[j].ToLower();

				editGotoButtons[0].transform.Find("Text").GetComponent<Text>().text = "previous";
				editGotoButtons[7].transform.Find("Text").GetComponent<Text>().text = "next";
				shift = 0;

				int index = logic.items [logic.currentItemIndex].goIndexes[j];
				currentOpenedButtonIndex = j;
	
				for (int k = 1; k < 7; k++) {
					
					if (index + k - 1 < logic.items.Length) {

						string value = logic.items [index + k - 1].title;// + ": " + logic.items [index + k - 1].description;
						if (k == 1) {
							value = "* " + value;
						}
						editGotoButtons[k].transform.Find("Text").GetComponent<Text>().text = value;

						
					} else {
						editGotoButtons[k].transform.Find("Text").GetComponent<Text>().text = "";
					}
				}

				editButtonPanel.gameObject.SetActive(true);
				break;
			}
			
			++j;
		}

		int indexGotoButton = 0;
		foreach (Button b in editGotoButtons) {
			if (b.gameObject == button) {
				if (indexGotoButton != 0 && indexGotoButton != editGotoButtons.Length - 1) {
					// change the route
					logic.items [logic.currentItemIndex].goIndexes[currentOpenedButtonIndex] = logic.items [logic.currentItemIndex].goIndexes[currentOpenedButtonIndex] + indexGotoButton - 1 + shift;
					shift = -1 * (indexGotoButton - 1);
				} else if (indexGotoButton == 0) {
					// previous
					--shift;
				} else {
					// next
					++shift;
				}

				refreshGotoButtons();
			}
			++indexGotoButton;
		}
	}

	private int shift = 0;
	private int currentOpenedButtonIndex = 0;

	public void refreshGotoButtons() {
		Debug.Log("refreshGotoButtons: " + shift);
		int index = logic.items [logic.currentItemIndex].goIndexes[currentOpenedButtonIndex];
	
		for (int k = 1; k < 7; k++) {
					
			if (index + k - 1 + shift < logic.items.Length) {

				string value = logic.items [index + k - 1 + shift].title;
				if (k == 1 - shift) {
					value = "* " + value;
				}
				editGotoButtons[k].transform.Find("Text").GetComponent<Text>().text = value;		
			} else {
				editGotoButtons[k].transform.Find("Text").GetComponent<Text>().text = "";
			}
					
				
		}
	}

	public void updateOrCreateQuestIfPossible() {
		if (GameStatusMagic.instance.user != null) {

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
				sw.Write (JsonUtility.ToJson (logic)); 
			}
		} catch (IOException) {
		}
	}
	
	public void load ()
	{
		if  (GameStatusMagic.instance.quest != null && GameStatusMagic.instance.quest._id != null && GameStatusMagic.instance.quest.text != null) {
			editButton.gameObject.SetActive(true);
			logic = GameStatusMagic.instance.quest.text;
			return;
		} 
		else {
			editButton.gameObject.SetActive(false);
		}

		var textAsset = Resources.Load ("Data/TemplateQuest") as TextAsset;

		if (lastClickedLink != null) {
			textAsset = Resources.Load (lastClickedLink) as TextAsset;
		}

		logic = JsonUtility.FromJson<Logic> (textAsset.text);
	}

	public void loadButtonsLogic() {
		var textAsset = Resources.Load ("Data/Buttons") as TextAsset;
		buttonsLogic = JsonUtility.FromJson<Buttons> (textAsset.text);    
	}
	
	string text;
	
	public void printText ()
	{
		gameViewText.text = text;
	}

	public Button editButton;

	public void showEditPanel() {
		editTitleField.text = logic.items[logic.currentItemIndex].title;
		editTextField.text = logic.items[logic.currentItemIndex].description;
		editView.SetActive(true);
	}

	public void saveChanges() {
		gameViewTitle.text = editTitleField.text;
		gameViewText.text = editTextField.text;
		logic.items[logic.currentItemIndex].title = editTitleField.text;
		logic.items[logic.currentItemIndex].description = editTextField.text;
		editView.SetActive(false);
	}

	public void saveButtonChanges() {
		editButtonPanel.gameObject.SetActive(false);
	}

	public void cancelChanges() {
		editView.SetActive(false);
	}

	public void cancelButtonChanges() {
		editButtonPanel.gameObject.SetActive(false);
	}
}
