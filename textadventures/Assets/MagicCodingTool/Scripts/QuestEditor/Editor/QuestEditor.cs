using System;
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

    [MenuItem("Window/Glowbom/Quests")]
    public static void ShowWindow() {
        GetWindow<QuestEditor> ("Quests");
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
                    // add button code here
                }

                if (GUILayout.Button("Remove")) {
                    // remove button code here
                }
                GUILayout.EndHorizontal();

                EditorGUILayout.Space();
                ++i;
            }

            EditorGUILayout.EndScrollView();
        }

        EditorGUILayout.Space();
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

            int i = 0;
            foreach(var goIndex in item.goIndexes) {
                if (goIndex >= 0) {
                    GUI.backgroundColor = Color.white;

                    GUILayout.Label("Button " + (i + 1), EditorStyles.label);
                    item.buttonsTexts[i] = EditorGUILayout.TextField("Title", item.buttonsTexts[i]);
                    item.goIndexes[i] = int.Parse(EditorGUILayout.TextField("Go To", goIndex.ToString()));
                    GUILayout.BeginHorizontal();
        
                    if (GUILayout.Button("Insert")) {
                        // add button code here
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
                        GUI.FocusControl(null);
                        item.goIndexes[i] = -1;
                        initItemUi();
                    }

                    GUILayout.EndHorizontal();
                    EditorGUILayout.Space();

                    ++i;
                }
            }
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
