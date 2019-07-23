using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine.UI;
using UnityEngine.Networking;

/*
 * Created on Sun Jul 21 2019
 *
 * Copyright (c) 2019 Glowbom, Inc.
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

	public GameObject loginView;
	public GameObject editView;
	public InputField editTitleField;
	public InputField editTextField;
	public InputField loginField;
	public InputField passwordField;
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

	public Image frontRu;

	public GameObject aboutRu;

	public string type;

	public Button loginButton;
	public Button logoutButton;
	public Button showLoginButton;
	public Button showSignupButton;

	public Button showLoginButton2;
	public Button showSignupButton2;
	

	public Text dontHaveAccountText;
	public Text email;

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
		GameStatusMagic.instance.load();
		startButtonText.text = GameStatusMagic.instance.questAnswers.Count == 0 ? "Create Quest" : "Edit Quest";  

		load ();
		loadButtonsLogic();
		procced ();
		//Advertisement.Initialize(gameId);

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

		if (GameStatusMagic.instance.getToken() != null && 
			!GameStatusMagic.instance.getToken().Equals("")) {
			//Debug.Log("token = " + GameStatusMagic.instance.getToken());
			showLoginButton.gameObject.SetActive(false);
			showLoginButton2.gameObject.SetActive(false);

			if (!edit) {
				editButton.gameObject.SetActive(true);
			}
			
			showSignupButton.gameObject.SetActive(false);
			showSignupButton2.gameObject.SetActive(false);
			dontHaveAccountText.gameObject.SetActive(false);
			logoutButton.gameObject.SetActive(true);

			updateLoginButtonTextIfNeeded();
		} else {
			//Debug.Log("token = " + GameStatusMagic.instance.getToken());
			showLoginButton.gameObject.SetActive(true);
			showSignupButton.gameObject.SetActive(true);
			showLoginButton2.gameObject.SetActive(true);
			editButton.gameObject.SetActive(false);
			showSignupButton2.gameObject.SetActive(true);
			dontHaveAccountText.gameObject.SetActive(true);
			logoutButton.gameObject.SetActive(false);
			email.text = "";
		}

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

	public void updateLoginButtonTextIfNeeded() {
		if (GameStatusMagic.instance.getToken() != null && 
			!GameStatusMagic.instance.getToken().Equals("") &&
			GameStatusMagic.instance.user.email != null) {
			email.text = GameStatusMagic.instance.user.email;
		}
	}

	public void comeBackPressed() {
        
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

	IEnumerator getUser(string url)
    {
		Debug.Log("getUser");
		loginField.enabled = false;
		passwordField.enabled = false;
		loginButton.enabled = false;
		status.text = "getting information...";
		
        var request = new UnityWebRequest(url, "GET");
        byte[] bodyRaw = System.Text.Encoding.UTF8.GetBytes("{}");
        request.uploadHandler = (UploadHandler) new UploadHandlerRaw(bodyRaw);
        request.downloadHandler = (DownloadHandler) new DownloadHandlerBuffer();
        request.SetRequestHeader("x-auth-token", GameStatusMagic.instance.getToken());
 
        yield return request.Send();

		loginField.enabled = true;
		passwordField.enabled = true;
		loginButton.enabled = true;

		if (request.isNetworkError)
        {
			Debug.Log("Error");
			status.text = request.error;
        }
        else
        {
			Debug.Log("OK");
			if (request.responseCode == 200) {
				Debug.Log("Great Success");
				loginView.SetActive(false);
				showLoginButton.gameObject.SetActive(false);
				showSignupButton.gameObject.SetActive(false);
				showLoginButton2.gameObject.SetActive(false);
				if (!edit) {
					editButton.gameObject.SetActive(true);
				}
				showSignupButton2.gameObject.SetActive(false);
				dontHaveAccountText.gameObject.SetActive(false);
				logoutButton.gameObject.SetActive(true);
				loginField.text = "";
				passwordField.text = "";
				status.text = "";

				GameStatusMagic.instance.user = JsonUtility.FromJson<GameStatusMagic.User>(request.downloadHandler.text);
				Debug.Log(GameStatusMagic.instance.user.email);
				GameStatusMagic.instance.save();
				updateLoginButtonTextIfNeeded();

				StartCoroutine(getQuest());
				

				// in case it  was sign up
				signupView.SetActive(false);
			} else {
				status.text = request.downloadHandler.text;
			}
        }
    }

	IEnumerator getQuest()
    {
		Debug.Log("getQuest");
        var request = new UnityWebRequest("https://glowbom.herokuapp.com/api/quests/user/" + GameStatusMagic.instance.user._id, "GET");
        byte[] bodyRaw = System.Text.Encoding.UTF8.GetBytes("{}");
        request.uploadHandler = (UploadHandler) new UploadHandlerRaw(bodyRaw);
        request.downloadHandler = (DownloadHandler) new DownloadHandlerBuffer();
        request.SetRequestHeader("x-auth-token", GameStatusMagic.instance.getToken());
 
        yield return request.Send();

		if (request.isNetworkError)
        {
			Debug.Log("Error");
        }
        else
        {
			Debug.Log("OK");
			if (request.responseCode == 200) {
				Debug.Log(request.downloadHandler.text);
				GameStatusMagic.instance.quest = JsonUtility.FromJson<GameStatusMagic.Quest>(request.downloadHandler.text);
				GameStatusMagic.instance.quest.text.currentItemIndex = 0;
				GameStatusMagic.instance.save();

				load ();
				procced ();
			} else {
				Debug.Log(request.downloadHandler.text);
			}
        }
    }

	public void createQuestInCloud() {
		StartCoroutine(createQuestInCloudAsync());
	}

	IEnumerator createQuestInCloudAsync()
    {
		Debug.Log("postQuest");
        var request = new UnityWebRequest("https://glowbom.herokuapp.com/api/quests/",GameStatusMagic.instance.quest._id == null ? "POST" : "PUT");
		//var request = new UnityWebRequest("https://glowbom.herokuapp.com/api/quests/","POST");
		string body = "{\"text\": " + GameStatusMagic.instance.quest.content +",\"userId\":\""+ GameStatusMagic.instance.user._id +"\"}";
		Debug.Log(body);
        byte[] bodyRaw = System.Text.Encoding.UTF8.GetBytes(body);
        request.uploadHandler = (UploadHandler) new UploadHandlerRaw(bodyRaw);
        request.downloadHandler = (DownloadHandler) new DownloadHandlerBuffer();
        request.SetRequestHeader("x-auth-token", GameStatusMagic.instance.getToken());
		request.SetRequestHeader("Content-Type", "application/json");
 
        yield return request.Send();

		if (request.isNetworkError)
        {
			Debug.Log("Error");
        }
        else
        {
			Debug.Log("OK");
			if (request.responseCode == 200) {
				Debug.Log(request.downloadHandler.text);
				GameStatusMagic.instance.quest = JsonUtility.FromJson<GameStatusMagic.Quest>(request.downloadHandler.text);
				GameStatusMagic.instance.quest.text.currentItemIndex = 0;
				GameStatusMagic.instance.save();

				load ();
				procced ();
			} else {
				Debug.Log(request.downloadHandler.text);
			}
        }
	}

	public void updateQuestInCloud() {
		StartCoroutine(updateQuestAsync());
	}

	IEnumerator updateQuestAsync()
    {
		GameStatusMagic.instance.quest.content = JsonUtility.ToJson (logic);
		while(GameStatusMagic.instance.quest.content.Contains("\n")) {
			GameStatusMagic.instance.quest.content = GameStatusMagic.instance.quest.content.Replace("\n", "[newline]");
		}

		Debug.Log("postQuest");
        var request = new UnityWebRequest("https://glowbom.herokuapp.com/api/quests/" + GameStatusMagic.instance.quest._id, "PUT");
		string body = "{\"text\": " + GameStatusMagic.instance.quest.content +",\"userId\":\""+ GameStatusMagic.instance.user._id +"\"}";
		Debug.Log(body);
        byte[] bodyRaw = System.Text.Encoding.UTF8.GetBytes(body);
        request.uploadHandler = (UploadHandler) new UploadHandlerRaw(bodyRaw);
        request.downloadHandler = (DownloadHandler) new DownloadHandlerBuffer();
        request.SetRequestHeader("x-auth-token", GameStatusMagic.instance.getToken());
		request.SetRequestHeader("Content-Type", "application/json");
 
        yield return request.Send();

		if (request.isNetworkError)
        {
			Debug.Log("Error");
        }
        else
        {
			Debug.Log("OK");
			if (request.responseCode == 200) {
				Debug.Log(request.downloadHandler.text);
				GameStatusMagic.instance.quest = JsonUtility.FromJson<GameStatusMagic.Quest>(request.downloadHandler.text);
				GameStatusMagic.instance.save();

				load ();
				procced ();
			} else {
				Debug.Log(request.downloadHandler.text);
			}
        }
	}

	IEnumerator login(string url, string bodyJsonString)
    {
		loginField.enabled = false;
		passwordField.enabled = false;
		loginButton.enabled = false;
		status.text = "loading...";
		
        var request = new UnityWebRequest(url, "POST");
        byte[] bodyRaw = System.Text.Encoding.UTF8.GetBytes(bodyJsonString);
        request.uploadHandler = (UploadHandler) new UploadHandlerRaw(bodyRaw);
        request.downloadHandler = (DownloadHandler) new DownloadHandlerBuffer();
        request.SetRequestHeader("Content-Type", "application/json");
 
        yield return request.Send();

		loginField.enabled = true;
		passwordField.enabled = true;
		loginButton.enabled = true;

		if (request.isNetworkError)
        {
			status.text = request.error;
        }
        else
        {
            // Show results as text
            //Debug.Log(request.downloadHandler.text);

            // Or retrieve results as binary data
            //byte[] results = request.downloadHandler.data;

			if (request.responseCode == 200) {
				GameStatusMagic.instance.storeToken(request.downloadHandler.text);
				StartCoroutine(getUser("https://glowbom.herokuapp.com/api/users/me"));
			} else {
				status.text = request.downloadHandler.text;
			}
        }
    }

	IEnumerator login()
    {
		return login("https://glowbom.herokuapp.com/api/auth", "{\"email\": \""+ loginField.text +"\",\"password\":\""+ passwordField.text +"\"}");
    }

	public void logout() {
		loginView.SetActive(false);
		GameStatusMagic.instance.quest = null;
		GameStatusMagic.instance.user = null;
		showLoginButton.gameObject.SetActive(true);
		showSignupButton.gameObject.SetActive(true);
		showLoginButton2.gameObject.SetActive(true);
		editButton.gameObject.SetActive(false);
		showSignupButton2.gameObject.SetActive(true);
		dontHaveAccountText.gameObject.SetActive(true);
		logoutButton.gameObject.SetActive(false);
		GameStatusMagic.instance.resetToken();
		email.text = "";
	}

	public void backLoginView() {
		loginView.SetActive(false);
	}
	
	public void showLoginPanel() {
		edit = true;
		backPressed();
		
		loginView.SetActive(true);
		logoutButton.gameObject.SetActive(false);
		loginField.text = "";
		passwordField.text = "";
		status.text = "";
	}

	public void loginPressed() {
		if (loginField.text.Equals("")) {
			status.text = "email can't be empty";
			return;
		}

		if (passwordField.text.Equals("")) {
			status.text = "password can't be empty";
			return;
		}

		StartCoroutine(login());
	}

	public void openPressed() {
		GameStatusMagic.instance.questAnswers.Clear();
		edit = true;
		load();

		startButtonText.text = GameStatusMagic.instance.questAnswers.Count == 0 ? "Create Quest" : "Edit Quest";

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


				if (edit) {
					if (logic.currentItemIndex != 0) {
						answers[key] = answer;
						GameStatusMagic.instance.questAnswers.Add(answer);
					} else {
						edit = false;
						GameStatusMagic.instance.save();
						startButtonText.text = "Edit Quest";

						// call create / update quest here
						load ();
					}
				}

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

	public bool edit = true;
	
	public void load ()
	{
		if  (GameStatusMagic.instance.quest != null && GameStatusMagic.instance.quest._id != null && GameStatusMagic.instance.quest.text != null) {
			edit = false;
			editButton.gameObject.SetActive(true);
			logic = GameStatusMagic.instance.quest.text;
			return;
		} 
		else {
			editButton.gameObject.SetActive(false);
		}

		var textAsset = Resources.Load (edit ? "Data/Questions" : "Data/TemplateQuest") as TextAsset;
		//This checks if your computer's operating system is in the French language

		if (lastClickedLink != null) {
			textAsset = Resources.Load (lastClickedLink) as TextAsset;
		}

		if (type != null && type.Equals("Lifebook")) {
			textAsset = Resources.Load (edit ? "Data/QuestionsLifebook" : "Data/TemplateQuest") as TextAsset;
		}
		logic = JsonUtility.FromJson<Logic> (textAsset.text);
		
		trackEvent("Book", "Loaded"); 

		if (!edit && GameStatusMagic.instance.user != null && GameStatusMagic.instance.user._id != null && GameStatusMagic.instance.quest == null) {
			string text = textAsset.text;
			if (text.Contains("{question")) {
				foreach(string key in answers.Keys) {
						//Debug.Log("key = " + key + "; value = " + answers[key]);
					while (text.Contains("{" + key + "}")) {
						text = text.Replace("{" + key + "}", answers[key]);	
					}
				}		
			}

			/* while(text.Contains("\n")) {
				text = text.Replace("\n", "[newline]");
			}

			while(text.Contains("\"")) {
				text = text.Replace("\"", "yoyoyo");
			}

			while(text.Contains("{")) {
				text = text.Replace("{", "99999");
			}

			while(text.Contains("}")) {
				text = text.Replace("}", "66666");
			}*/
			GameStatusMagic.instance.quest = new GameStatusMagic.Quest();
			GameStatusMagic.instance.quest.content = text;
			createQuestInCloud();
		}
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

	// signup
	public void backSignUpView() {
		signupView.SetActive(false);
	}

	public InputField signupField;
	public InputField signupPasswordField;
	public InputField signupConfirmPasswordField;
	public Text signupStatus;
	public Button signupButton;
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
		updateQuestInCloud();
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

	public void showSignUpPanel() {
		edit = true;
		backPressed();

		signupView.SetActive(true);
		logoutButton.gameObject.SetActive(false);
		signupField.text = "";
		signupPasswordField.text = "";
		signupConfirmPasswordField.text = "";
		signupStatus.text = "";

		signupField.enabled = true;
		signupPasswordField.enabled = true;
		signupConfirmPasswordField.enabled = true;
		signupButton.enabled = true;
	}

	IEnumerator signup(string url, string bodyJsonString)
    {
		signupField.enabled = false;
		signupPasswordField.enabled = false;
		signupConfirmPasswordField.enabled = false;
		signupButton.enabled = false;
		signupStatus.text = "Creating an account...";
		
        var request = new UnityWebRequest(url, "POST");
        byte[] bodyRaw = System.Text.Encoding.UTF8.GetBytes(bodyJsonString);
        request.uploadHandler = (UploadHandler) new UploadHandlerRaw(bodyRaw);
        request.downloadHandler = (DownloadHandler) new DownloadHandlerBuffer();
        request.SetRequestHeader("Content-Type", "application/json");
 
        yield return request.Send();

		signupField.enabled = true;
		signupPasswordField.enabled = true;
		signupConfirmPasswordField.enabled = true;
		signupButton.enabled = true;

		if (request.isNetworkError)
        {
			signupStatus.text = request.error;
        }
        else
        {
			if (request.responseCode == 200) {
				signupField.enabled = true;
				signupPasswordField.enabled = true;
				signupConfirmPasswordField.enabled = true;
				signupButton.enabled = true;

				GameStatusMagic.instance.storeToken(request.downloadHandler.text);
				signupStatus.text = "Logging in...";
				StartCoroutine(login("https://glowbom.herokuapp.com/api/auth", bodyJsonString));
			} else {
				signupStatus.text = request.downloadHandler.text;
			}
        }
    }

	public void signupPressed() {
		if (signupField.text.Equals("")) {
			signupStatus.text = "email can't be empty";
			return;
		}

		if (signupPasswordField.text.Equals("")) {
			signupStatus.text = "password can't be empty";
			return;
		}

		if (signupConfirmPasswordField.text.Equals("")) {
			signupStatus.text = "password can't be empty";
			return;
		}

		if (!signupConfirmPasswordField.text.Equals(signupPasswordField.text)) {
			signupStatus.text = "password doesn't match";
			return;
		}

		StartCoroutine(signup("https://glowbom.herokuapp.com/api/users", "{\"email\": \""+ signupField.text +"\",\"password\":\""+ signupConfirmPasswordField.text +"\"}"));
	}
}
