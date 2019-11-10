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
			
			/*if (deadValue > -1 && deadValue < heroValues.Length) {
				if (heroValues [deadValue] <= deadLevel) {
					currentItemIndex = deadItemIndex;
					nextItem = items [currentItemIndex];
					pleaseRestart = true;
				}
			}
*/

			
			
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
    public InputField clipboard;

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
    public InputField[] inputFields;

	public Button[] gridButtons;
	public Image[] pictures;
	public Logic logic = null;

	public Text startButtonText;

	private Buttons buttonsLogic = null;

	public Image front;

	public Image gridBackground;

	public GameObject about;

	public GameObject gridButtonsPanel;

	public Text status;

	Dictionary<string, string> answers = new Dictionary<string, string>();
	
	public static void trackEvent(string category, string action) {

	}
	
	private static void resetDraggablePanelPosition (Transform view)
	{

	}
	
	public void procced ()
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
						
						buttons [i].enabled = item.goIndexes [i] != -1;
						buttons [i].gameObject.SetActive(item.goIndexes [i] != -1);
					}
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

                    pictures[0].gameObject.SetActive(false);

                    if (item.picturesSpriteNames.Length != 0)
                    {
                        for (int i = 0; i < item.picturesSpriteNames.Length; i++)
                        {
                            if (i < pictures.Length)
                            {
                                if (sprites.ContainsKey(item.picturesSpriteNames[i]))
                                {
                                    pictures[i].sprite = sprites[item.picturesSpriteNames[i]];
                                    pictures[i].gameObject.SetActive(!item.picturesSpriteNames[i].Equals(string.Empty));
                                }
                        
                            }
                        }
                    }
				}
                else
                {
                    pictures[0].gameObject.SetActive(false);
                }
				
			} 
		}
	}

	Dictionary<string, Sprite> sprites = new Dictionary<string, Sprite>();

	// Use this for initialization
	void Start ()
	{	
		sprites.Clear();
		Sprite sprite = Resources.Load("Textures/default", typeof(Sprite)) as Sprite;
		sprites.Add("default", sprite);

        GameStatusMagic.instance.load();

        load();

        foreach(var item in logic.items)
        {
            if (item.picturesSpriteNames != null && item.picturesSpriteNames.Length != 0)
            {
                for (int i = 0; i < item.picturesSpriteNames.Length; i++)
                {
                    if (i < pictures.Length)
                    {
                        string key = item.picturesSpriteNames[i];
                        if (!sprites.ContainsKey(key))
                        {
                            sprite = Resources.Load("Textures/images/" + key, typeof(Sprite)) as Sprite;
                            if (sprite != null)
                            {
                                sprites.Add(key, sprite);
                            }
                        }

                    }
                }
            }
        }

        loadButtonsLogic();
        procced();

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
	
	public void buttonPressed (int i)
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

		logic.nextItem (i);
		procced ();
	}

	private int shift = 0;
	private int currentOpenedButtonIndex = 0;

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
			using (StreamWriter sw = new StreamWriter ("Assets/Glowbom/Quests/Resources/Data/TemplateQuest.txt", false)) {
				sw.Write (JsonUtility.ToJson (logic)); 
			}
		} catch (IOException) {
		}
	}
	
	public void load ()
	{
		editButton.gameObject.SetActive(true);

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
    public QuestCreator creator;

	public void showEditPanel() {
        homePressed();
        creator.initMainQuest();
        editView.SetActive(true);
        if (clipboard != null)
        {
            clipboard.gameObject.SetActive(false);
            clipboard.text = "";
        }
    }

    public void homePressed()
    {
        logic.currentItemIndex = 0;
        procced();
    }

    public void importPressed()
    {
        if (clipboard != null)
        {
            clipboard.gameObject.SetActive(true);

            if (clipboard.text != "")
            {
                Logic newLogic = JsonUtility.FromJson<Logic>(clipboard.text);
                if (newLogic != null)
                {
                    logic = newLogic;
                    logic.currentItemIndex = 0;
                    procced();
                    QuestLoader loader = new QuestLoader();
                    loader.logic = logic;
                    loader.save();
                    clipboard.gameObject.SetActive(false);
                    clipboard.text = "";
                }
            }
        }

#if UNITY_EDITOR
        TextEditor te = new TextEditor();
        te.Paste();
        Logic l = JsonUtility.FromJson<Logic>(te.text);
        if (l != null)
        {
            logic = l;
            logic.currentItemIndex = 0;
            procced();
            QuestLoader loader = new QuestLoader();
            loader.logic = logic;
            loader.save();
        }
#endif
    }

    public void exportPressed()
    {
        if (clipboard != null)
        {
            clipboard.text = JsonUtility.ToJson(logic);
            clipboard.Select();
            clipboard.gameObject.SetActive(true);
        }

#if UNITY_EDITOR
        TextEditor te = new TextEditor();
        te.text = JsonUtility.ToJson(logic);
        te.SelectAll();
        te.Copy();
#endif
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
