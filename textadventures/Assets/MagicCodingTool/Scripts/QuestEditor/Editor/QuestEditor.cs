using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

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
        items.Insert(i, item);

        questLoader.logic.items = items.ToArray();

        foreach (var logicItem in questLoader.logic.items) {
            for(int j = 0; j < logicItem.goIndexes.Length; j++) {
                if (logicItem.goIndexes[j] >= i) {
                    logicItem.goIndexes[j] = logicItem.goIndexes[j] + 1;
                }
            }
        }

        GUI.FocusControl(null);
        initAllTabUi();
    }

    private void remove(int i) {
        List<Logic.Item> items = new List<Logic.Item>(questLoader.logic.items);
        items.RemoveAt(i);

        questLoader.logic.items = items.ToArray();

        foreach (var logicItem in questLoader.logic.items) {
            for(int j = 0; j < logicItem.goIndexes.Length; j++) {
                if (logicItem.goIndexes[j] >= i) {
                    logicItem.goIndexes[j] = logicItem.goIndexes[j] - 1;
                    if (logicItem.goIndexes[j] < 0) {
                        logicItem.goIndexes[j] = 0;
                    }
                }
            }
        }

        GUI.FocusControl(null);
        initAllTabUi();
    }

    private void initAllTabUi() {
        EditorGUILayout.Space();

        if (questLoader.logic != null) {
            EditorGUILayout.Space();

            scrollPos = EditorGUILayout.BeginScrollView(scrollPos, GUILayout.Width(position.width - 20), GUILayout.Height(600));
            int i = 0;
            foreach (var item in questLoader.logic.items)
            {
                if (GUILayout.Button(i + " : " + item.title)) {
                    GUI.FocusControl(null);
                    questLoader.logic.currentItemIndex = Array.IndexOf(questLoader.logic.items, item);
                    tabElements = 1;
                    OnGUI();
                }

                GUILayout.BeginHorizontal();
                if (GUILayout.Button("Insert")) {
                    insert(i);
                }

                if (GUILayout.Button("Remove")) {
                    remove(i);
                }
                GUILayout.EndHorizontal();

                EditorGUILayout.Space();
                ++i;
            }

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
            goConditionsList.Insert(i, 0);
        }

        goIndexesList.Insert(i, 0);
        buttonsTextsList.Insert(i, "Go Button");

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
        List<int> goConditionsList = new List<int>(item.goConditions);

        if (goConditionsList.Count > 0) {
            goConditionsList.RemoveAt(i);
        }

        goIndexesList.RemoveAt(i);
        buttonsTextsList.RemoveAt(i);

        item.buttonsTexts = buttonsTextsList.ToArray();
        item.goIndexes = goIndexesList.ToArray();

        if (goConditionsList.Count > 0) {
            item.goConditions = goConditionsList.ToArray();
        }

        GUI.FocusControl(null);
        initItemUi();
    }

    private void initItemUi() {
        EditorGUILayout.Space();

        if (questLoader.logic != null) {
            var item = questLoader.logic.items[questLoader.logic.currentItemIndex];
            GUILayout.Label("Element " + questLoader.logic.currentItemIndex, EditorStyles.label);

            item.title = EditorGUILayout.TextField("Title", item.title);
            EditorGUILayout.Space();

            item.description = EditorGUILayout.TextArea(item.description, GUILayout.Height(100));

            EditorGUILayout.Space();

            scrollPosButtons = EditorGUILayout.BeginScrollView(scrollPosButtons, GUILayout.Width(position.width - 20), GUILayout.Height(600));

            int i = 0;
            foreach(var goIndex in item.goIndexes) {
                if (goIndex >= 0) {
                    GUI.backgroundColor = Color.white;

                    GUILayout.Label("Button " + (i + 1), EditorStyles.label);
                    item.buttonsTexts[i] = EditorGUILayout.TextField("Title", item.buttonsTexts[i]);
                    item.goIndexes[i] = int.Parse(EditorGUILayout.TextField("Go To", item.goIndexes[i].ToString()));
                    GUILayout.BeginHorizontal();
        
                    if (GUILayout.Button("Insert")) {
                        insertButton(i);
                    }

                    if (GUILayout.Button("Go")) {
                        if (goIndex >= 0 && goIndex < questLoader.logic.items.Length) {
                            GUI.FocusControl(null);
                            questLoader.logic.currentItemIndex = goIndex;
                            initItemUi();
                        }
                    }

                    
                    GUI.backgroundColor = new Color32(238, 32, 77, 255);
                    var style = new GUIStyle(GUI.skin.button);
                    style.normal.textColor = Color.white;
                    if (GUILayout.Button("Remove", style)) {
                        removeButton(i);
                    }

                    GUILayout.EndHorizontal();
                    EditorGUILayout.Space();

                    ++i;
                }
            }

            EditorGUILayout.EndScrollView();
        }
    }

    private void initMainQuest() {
        // main quest

        GUILayout.BeginVertical(EditorStyles.helpBox);

        EditorGUILayout.Space();

        GUILayout.Label(questLoader.name, EditorStyles.label);

        EditorGUILayout.Space();

        var item = questLoader.logic.items[questLoader.logic.currentItemIndex];
        tabElements = GUILayout.Toolbar (tabElements, new string[] {"All", questLoader.logic.currentItemIndex + " : " + item.title});
        switch (tabElements) {
            case 0:
                initAllTabUi();
            break;
            case 1:
                initItemUi();
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
        
            if (GUILayout.Button("Load")) {
                questLoader.load();
            }

            if (GUILayout.Button("Save")) {
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
