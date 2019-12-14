#if UNITY_EDITOR

using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEngine.UI;

/*
 * Created on Sun Jul 21 2019
 *
 * Copyright (c) 2019 Glowbom.
 */
public class QuestEditor : EditorWindow
{   
    static bool cloudSaveEanbled = false;
    static bool projectsEnabled = false;
    static bool templatesEnabled = false;

    static QuestLoader questLoader = null;

    static QuestEditor() {
        questLoader = new QuestLoader();
    }

    private int tab = 0;
    private int tabElements = 0;
    private Vector2 scrollPos;
    private Vector2 scrollPosButtons;

    [MenuItem("Window/Glowbom/Quests")]
    public static void ShowWindow() {
        GetWindow<QuestEditor> ("Quests");
    }

    private void insert(int i) {
        Logic.Item item = new Logic.Item();
        item.title = "New Title";
        item.description = "Hello!";
        item.buttonsTexts = new string[1];
        item.buttonsTexts[0] = "Go Button";
        item.goIndexes = new int[1];
        item.goIndexes[0] = 0;

        List<Logic.Item> items = new List<Logic.Item>(questLoader.logic.items);
        items.Insert(i + 1, item);

        questLoader.logic.items = items.ToArray();

        foreach (var logicItem in questLoader.logic.items) {
            for(int j = 0; j < logicItem.goIndexes.Length; j++) {
                if (logicItem.goIndexes[j] >= i + 1) {
                    logicItem.goIndexes[j] = logicItem.goIndexes[j] + 1;
                }
            }
        }

        GUI.FocusControl(null);
        initAllTabUi();
    }

    private void remove(int i) {
        List<Logic.Item> items = new List<Logic.Item>(questLoader.logic.items);
        if (items.Count > 1)
        {
            items.RemoveAt(i);

            questLoader.logic.items = items.ToArray();

            foreach (var logicItem in questLoader.logic.items)
            {
                for (int j = 0; j < logicItem.goIndexes.Length; j++)
                {
                    if (logicItem.goIndexes[j] >= i)
                    {
                        logicItem.goIndexes[j] = logicItem.goIndexes[j] - 1;
                        if (logicItem.goIndexes[j] < 0)
                        {
                            logicItem.goIndexes[j] = 0;
                        }
                    }
                }
            }

            if (questLoader.logic.currentItemIndex == i)
            {
                questLoader.logic.currentItemIndex = 0;
            }

            GUI.FocusControl(null);
            initAllTabUi();
        }  
    }

    private string createTitle(Logic.Item item, int i)
    {
        string buttonTitle = i + " : [" + item.title + "] " + item.description;

        if (item.title == "")
        {
            buttonTitle = i + " : " + item.description;
        }

        if (i == questLoader.logic.currentItemIndex)
        {
            buttonTitle = "* " + buttonTitle;
        }

        buttonTitle = buttonTitle.Replace("\n", "");

        try
        {
            buttonTitle = buttonTitle.Substring(0, 30);
            buttonTitle += "...";
        }
        catch (ArgumentOutOfRangeException)
        {
            // less then 30 characters
        }

        return buttonTitle;
    }

    public void append()
    {
        Logic.Item item = new Logic.Item();
        item.title = "New Title";
        item.description = "Hello!";
        item.buttonsTexts = new string[1];
        item.buttonsTexts[0] = "Go Button";
        item.goIndexes = new int[1];
        item.goIndexes[0] = 0;

        List<Logic.Item> items = new List<Logic.Item>(questLoader.logic.items);
        items.Add(item);

        questLoader.logic.items = items.ToArray();
        questLoader.logic.currentItemIndex = questLoader.logic.items.Length - 1;
        GUI.FocusControl(null);
        initAllTabUi();
    }

    private void initAllTabUi() {
        EditorGUILayout.Space();

        if (questLoader.logic != null) {
            if (GUILayout.Button("Add"))
            {
                append();
            }

            EditorGUILayout.Space();

            scrollPos = EditorGUILayout.BeginScrollView(scrollPos, GUILayout.Width(position.width - 20), GUILayout.Height(600));
            int i = 0;
            foreach (var item in questLoader.logic.items)
            {
                string buttonTitle = createTitle(item, i);

                GUILayout.BeginHorizontal();
                if (GUILayout.Button(buttonTitle)) {
                    GUI.FocusControl(null);
                    questLoader.logic.currentItemIndex = Array.IndexOf(questLoader.logic.items, item);
                    tabElements = 1;
                    OnGUI();
                }

                if (GUILayout.Button("Remove"))
                {
                    remove(i);
                }

                GUILayout.EndHorizontal();

                /*if (GUILayout.Button("Insert")) {
                    insert(i);
                }*/

               
                

                EditorGUILayout.Space();
                ++i;
            }

            EditorGUILayout.Space();

            //initInitialHeroValues();

            EditorGUILayout.EndScrollView();
        }

        EditorGUILayout.Space();
    }

    private void insertButton(int i) {
        var item = questLoader.logic.items[questLoader.logic.currentItemIndex];
        List<string> buttonsTextsList = new List<string>(item.buttonsTexts);
        List<int> goIndexesList = new List<int>(item.goIndexes);
        List<int> goConditionsList = item.goConditions == null ? new List<int>() : new List<int>(item.goConditions);

        if (goConditionsList.Count > 0) {
            goConditionsList.Insert(i + 1, 0);
        }

        goIndexesList.Insert(i + 1, 0);
        buttonsTextsList.Insert(i + 1, "Go Button");

        item.buttonsTexts = buttonsTextsList.ToArray();
        item.goIndexes = goIndexesList.ToArray();

        if (goConditionsList.Count > 0) {
            item.goConditions = goConditionsList.ToArray();
        }

        GUI.FocusControl(null);
        initItemUi();
    }

    private void removeButton(int i) {
        var item = questLoader.logic.items[questLoader.logic.currentItemIndex];
        List<string> buttonsTextsList = new List<string>(item.buttonsTexts);
        List<int> goIndexesList = new List<int>(item.goIndexes);
        List<int> goConditionsList = item.goConditions != null ? new List<int>(item.goConditions) : new List<int>();

        if (item.goConditions != null && goConditionsList.Count > 0) {
            goConditionsList.RemoveAt(i);
        }

        goIndexesList.RemoveAt(i);
        buttonsTextsList.RemoveAt(i);

        item.buttonsTexts = buttonsTextsList.ToArray();
        item.goIndexes = goIndexesList.ToArray();

        if (item.goConditions != null && goConditionsList.Count > 0) {
            item.goConditions = goConditionsList.ToArray();
        }

        GUI.FocusControl(null);
        initItemUi();
    }

    int questsCount = 1;
    string deafautQuestName = "Quest";

    private void initQuestsUi()
    {
        EditorGUILayout.Space();

        if (questLoader.logic != null)
        {
            var item = questLoader.logic.items[questLoader.logic.currentItemIndex];
            GUILayout.Label("Supporting Multiple Quests", EditorStyles.label);

            questsCount = int.Parse(EditorGUILayout.TextField("Count", questsCount.ToString()));

            EditorGUILayout.Space();

            scrollPosButtons = EditorGUILayout.BeginScrollView(scrollPosButtons, GUILayout.Width(position.width - 20), GUILayout.Height(500));

            
            for (int i = 0; i < questsCount; i++)
            {
                GUI.backgroundColor = Color.white;

                GUILayout.Label("Quest " + (i + 1), EditorStyles.label);
                questLoader.name = EditorGUILayout.TextField("Name", questLoader.name);
                deafautQuestName = EditorGUILayout.TextField("Title", deafautQuestName);
                GUILayout.BeginHorizontal();

                if (GUILayout.Button("Insert"))
                {
                    //insertButton(i);
                }

                if (GUILayout.Button("Open"))
                {
                    //if (goIndex >= 0 && goIndex < questLoader.logic.items.Length)
                    //{
                    //    GUI.FocusControl(null);
                    //    questLoader.logic.currentItemIndex = goIndex;
                    //    initItemUi();
                    //}
                }


                GUI.backgroundColor = new Color32(238, 32, 77, 255);
                var style = new GUIStyle(GUI.skin.button);
                style.normal.textColor = Color.white;
                if (GUILayout.Button("Remove", style))
                {
                    //removeButton(i);
                    break;
                }

                GUILayout.EndHorizontal();
                EditorGUILayout.Space();
            }

            EditorGUILayout.Space();

            //initHeroValues();

            EditorGUILayout.EndScrollView();
        }
    }



    private void initItemUi() {
        EditorGUILayout.Space();

        if (questLoader.logic != null) {
            var item = questLoader.logic.items[questLoader.logic.currentItemIndex];
            GUILayout.Label("Screen " + questLoader.logic.currentItemIndex, EditorStyles.label);

            item.title = EditorGUILayout.TextField("Title", item.title);
            EditorGUILayout.Space();

            var areaStyle = new GUIStyle(GUI.skin.textArea);
            areaStyle.wordWrap = true;
            var width = position.width - 35;

            //item.description = EditorGUILayout.TextArea(item.description, GUILayout.Width(150));

            areaStyle.fixedHeight = 0; // reset height, else CalcHeight gives wrong numbers
            areaStyle.fixedHeight = areaStyle.CalcHeight(new GUIContent(item.description), width);
            item.description = EditorGUILayout.TextArea(item.description, areaStyle, GUILayout.Height(areaStyle.fixedHeight));

            EditorGUILayout.Space();

            if (item.picturesSpriteNames == null || item.picturesSpriteNames.Length == 0)
            {
                item.picturesSpriteNames = new string[1];
            }

            item.picturesSpriteNames[0] = EditorGUILayout.TextField("Image", item.picturesSpriteNames[0]);

            EditorGUILayout.Space();

            scrollPosButtons = EditorGUILayout.BeginScrollView(scrollPosButtons, GUILayout.Width(position.width - 20), GUILayout.Height(500));

            int i = 0;
            foreach(var goIndex in item.goIndexes) {
                if (goIndex >= 0) {
                    GUI.backgroundColor = Color.white;

                    GUILayout.Label("Button " + (i + 1), EditorStyles.label);
                    item.buttonsTexts[i] = EditorGUILayout.TextField("Title", item.buttonsTexts[i]);
                    item.goIndexes[i] = int.Parse(EditorGUILayout.TextField("Go To", item.goIndexes[i].ToString()));
                    GUILayout.BeginHorizontal();

                    if (GUILayout.Button("Insert"))
                    {
                        insertButton(i);
                    }

                    if (GUILayout.Button("Go"))
                    {
                        if (goIndex >= 0 && goIndex < questLoader.logic.items.Length)
                        {
                            GUI.FocusControl(null);
                            questLoader.logic.currentItemIndex = goIndex;
                            initItemUi();
                        }
                    }


                    GUI.backgroundColor = new Color32(238, 32, 77, 255);
                    var style = new GUIStyle(GUI.skin.button);
                    style.normal.textColor = Color.white;
                    if (GUILayout.Button("Remove", style))
                    {
                        removeButton(i);
                        break;
                    }

                    GUILayout.EndHorizontal();
                    EditorGUILayout.Space();

                    ++i;

                }
            }

            EditorGUILayout.Space();

            //initHeroValues();

            EditorGUILayout.EndScrollView();
        }
    }

    private void initHeroValues() {
        var item = questLoader.logic.items[questLoader.logic.currentItemIndex];
        GUILayout.Label("Values", EditorStyles.label);

        EditorGUILayout.Space();

        if (questLoader.logic.heroElements == null || questLoader.logic.heroElements.Length == 0) {
            questLoader.logic.heroElements = new string[1];
            questLoader.logic.heroElements[0] = "Points";

            questLoader.logic.heroValues = new int[1];
            questLoader.logic.heroValues[0] = 0;
        }

        if (item.heroValues == null || item.heroValues.Length == 0 || item.heroValues.Length != questLoader.logic.heroValues.Length) {
            item.heroValues = new int[questLoader.logic.heroValues.Length];
        }

        for(int x = 0; x < questLoader.logic.heroValues.Length; x++) {
            GUI.backgroundColor = Color.white;

            questLoader.logic.heroElements[x] = EditorGUILayout.TextField("Name", questLoader.logic.heroElements[x]);
            item.heroValues[x] = int.Parse(EditorGUILayout.TextField(questLoader.logic.heroElements[x], item.heroValues[x].ToString()));
            GUILayout.BeginHorizontal();
        
            if (GUILayout.Button("Insert")) {
                insertHeroValue(x);
            }

            if (GUILayout.Button("Remove")) {
                removeHeroValue(x); 
            }

            GUILayout.EndHorizontal();
        }

        EditorGUILayout.Space();
    }

    private void initInitialHeroValues() {
        GUILayout.Label("Values", EditorStyles.label);

        EditorGUILayout.Space();

        if (questLoader.logic.heroElements == null || questLoader.logic.heroElements.Length == 0) {
            questLoader.logic.heroElements = new string[1];
            questLoader.logic.heroElements[0] = "Points";

            questLoader.logic.heroValues = new int[1];
            questLoader.logic.heroValues[0] = 0;
        }

        for(int x = 0; x < questLoader.logic.heroValues.Length; x++) {
            GUI.backgroundColor = Color.white;

            questLoader.logic.heroElements[x] = EditorGUILayout.TextField("Name", questLoader.logic.heroElements[x]);
            questLoader.logic.heroValues[x] = int.Parse(EditorGUILayout.TextField(questLoader.logic.heroElements[x], questLoader.logic.heroValues[x].ToString()));
            GUILayout.BeginHorizontal();
        
            if (GUILayout.Button("Insert")) {
                insertInitialHeroValue(x);
            }

            if (GUILayout.Button("Remove")) {
                removeInitialHeroValue(x); 
            }

            GUILayout.EndHorizontal();
        }

        EditorGUILayout.Space();
    }

    private void insertHeroValue(int i) {
        var item = questLoader.logic.items[questLoader.logic.currentItemIndex];
        List<string> heroElementsList = new List<string>(questLoader.logic.heroElements);
        List<int> heroValuesList = new List<int>(questLoader.logic.heroValues);
        List<int> heroValuesItemList = new List<int>(item.heroValues);

        heroValuesList.Insert(i + 1, 0);
        heroValuesItemList.Insert(i + 1, 0);
        heroElementsList.Insert(i + 1, "Points " + i);

        questLoader.logic.heroElements = heroElementsList.ToArray();
        questLoader.logic.heroValues = heroValuesList.ToArray();
        item.heroValues = heroValuesItemList.ToArray();

        GUI.FocusControl(null);
        initItemUi();
    }

    private void removeHeroValue(int i) {
        var item = questLoader.logic.items[questLoader.logic.currentItemIndex];
        List<string> heroElementsList = new List<string>(questLoader.logic.heroElements);
        List<int> heroValuesList = new List<int>(questLoader.logic.heroValues);
        List<int> heroValuesItemList = new List<int>(item.heroValues);

        heroElementsList.RemoveAt(i);
        heroValuesList.RemoveAt(i);
        heroValuesItemList.RemoveAt(i);

        questLoader.logic.heroElements = heroElementsList.ToArray();
        questLoader.logic.heroValues = heroValuesList.ToArray();
        item.heroValues = heroValuesItemList.ToArray();

        GUI.FocusControl(null);
        initItemUi();
    }

    private void insertInitialHeroValue(int i) {
        List<string> heroElementsList = new List<string>(questLoader.logic.heroElements);
        List<int> heroValuesList = new List<int>(questLoader.logic.heroValues);

        heroValuesList.Insert(i + 1, 0);
        heroElementsList.Insert(i + 1, "Points " + i);

        questLoader.logic.heroElements = heroElementsList.ToArray();
        questLoader.logic.heroValues = heroValuesList.ToArray();

        GUI.FocusControl(null);
        initItemUi();
    }

    private void removeInitialHeroValue(int i) {
        List<string> heroElementsList = new List<string>(questLoader.logic.heroElements);
        List<int> heroValuesList = new List<int>(questLoader.logic.heroValues);

        heroElementsList.RemoveAt(i);
        heroValuesList.RemoveAt(i);

        questLoader.logic.heroElements = heroElementsList.ToArray();
        questLoader.logic.heroValues = heroValuesList.ToArray();

        GUI.FocusControl(null);
        initItemUi();
    }

    private void initMainQuest() {
        // main quest

        GUILayout.BeginVertical(EditorStyles.helpBox);

        EditorGUILayout.Space();

        questLoader.name = EditorGUILayout.TextField("Name", questLoader.name);

        EditorGUILayout.Space();

        GUILayout.Label(questLoader.name + " [" + questLoader.logic.items.Length + " items]", EditorStyles.label);

        EditorGUILayout.Space();

        var item = questLoader.logic.items[questLoader.logic.currentItemIndex];
        string buttonTitle = createTitle(item, questLoader.logic.currentItemIndex);
        tabElements = GUILayout.Toolbar (tabElements, new string[] { "All", buttonTitle, "Quests" });
        switch (tabElements) {
            case 0:
                initAllTabUi();
            break;
            case 1:
                initItemUi();
            break;
            case 2:
                initQuestsUi();
                break;
        }

        GUILayout.EndVertical();

        /// end of elements

        EditorGUILayout.Space();

        if (projectsEnabled) {
            initProjectsUi();
        }

        if (templatesEnabled) {
            initTemplatesUi();
        }

        EditorGUILayout.Space();
    }

    private void OnGUI()
    {
        questLoader.initialize();

        GUILayout.Label("Glowbom", EditorStyles.boldLabel);

        GUILayout.Label("Quests", EditorStyles.label);

        EditorGUILayout.Space();

        GUILayout.BeginHorizontal();

        if (GUILayout.Button("Home"))
        {
            tabElements = 0;
            questLoader.logic.currentItemIndex = 0;
            questLoader.save();
            questLoader.load();
        }

        if (GUILayout.Button("Import"))
        {
            TextEditor te = new TextEditor();
            te.Paste();
            questLoader.logic = JsonUtility.FromJson<Logic>(te.text);
            if (questLoader.logic != null)
            {
                questLoader.save();
            }
            else
            {
                questLoader.load();
            }
        }

        if (GUILayout.Button("Export"))
        {
            TextEditor te = new TextEditor();
            te.text = JsonUtility.ToJson(questLoader.logic);
            te.SelectAll();
            te.Copy();
        }

        if (GUILayout.Button("Load")) 
        {
            questLoader.load();
        }

        if (GUILayout.Button("Save"))
        {
            Image mainImage = GameObject.Find("MainImage").GetComponent<Image>();
            if (mainImage.GetComponent<RectTransform>().hasChanged)
            {
                var item = questLoader.logic.items[questLoader.logic.currentItemIndex];
                item.mainImagePosition = mainImage.rectTransform.localPosition;
                item.mainImageSize = mainImage.rectTransform.sizeDelta;
            }

            questLoader.save();
        }

        GUILayout.EndHorizontal();
        EditorGUILayout.Space();

        if (cloudSaveEanbled) {
            initCloudSaveUi();
        }

        EditorGUILayout.Space();

        if (questLoader.logic != null) {
            initMainQuest();
        }
    }

    private void initCloudSaveUi() {
        GUILayout.BeginVertical(EditorStyles.helpBox);

        EditorGUILayout.Space();

        GUILayout.Label("Cloud Storage", EditorStyles.label);

        EditorGUILayout.Space();

        GUILayout.Label("Glowbom Account", EditorStyles.label);

        EditorGUILayout.Space();

        tab = GUILayout.Toolbar (tab, new string[] {"Login", "Sign Up"});
        switch (tab) {
            case 0:
                EditorGUILayout.Space();

                EditorGUILayout.TextField("Email", "");
                EditorGUILayout.TextField("Password", "");

                EditorGUILayout.Space();

                if (GUILayout.Button("Login")) {
                    // login code here
                }

                EditorGUILayout.Space();
            break;
            case 1:
                EditorGUILayout.Space();

                EditorGUILayout.TextField("Email", "");
                EditorGUILayout.TextField("New Password", "");
                EditorGUILayout.TextField("Confirm Password", "");

                EditorGUILayout.Space();

                if (GUILayout.Button("Sign Up")) {
                    // login code here
                }

                EditorGUILayout.Space();
            break;
        }

        GUILayout.EndVertical();
    }

    private void initProjectsUi() {
        // more quests

        GUILayout.BeginVertical(EditorStyles.helpBox);

        EditorGUILayout.Space();

        GUILayout.Label("Projects", EditorStyles.label);

        EditorGUILayout.Space();

        GUILayout.EndVertical();

        EditorGUILayout.Space();
    }

    private void initTemplatesUi() {
        // templates

        GUILayout.BeginVertical(EditorStyles.helpBox);

        EditorGUILayout.Space();

        GUILayout.Label("Templates", EditorStyles.label);

        EditorGUILayout.Space();

        GUILayout.EndVertical();
    }
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}

#endif
