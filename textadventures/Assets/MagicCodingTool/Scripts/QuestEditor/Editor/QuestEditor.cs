using System.Collections;
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

    [MenuItem("Window/Glowbom/Quests")]
    public static void ShowWindow() {
        GetWindow<QuestEditor> ("Quests");
    }

    private void initAllTabUi() {
        EditorGUILayout.Space();

        if (questLoader.logic != null) {
            int i = 0;
            foreach (var item in questLoader.logic.items)
            {
                if (GUILayout.Button(i + " : " + item.title)) {
                    
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
        }

        EditorGUILayout.Space();
    }

    private void OnGUI()
    {
        questLoader.initialize();

        GUILayout.Label("Glowbom", EditorStyles.boldLabel);

        GUILayout.Label("Quests", EditorStyles.label);

        EditorGUILayout.Space();

        if (cloudSaveEanbled) {
            initCloudSaveUi();
        }

        EditorGUILayout.Space();

        // main quest

        GUILayout.BeginVertical(EditorStyles.helpBox);

        EditorGUILayout.Space();

        GUILayout.Label(questLoader.name, EditorStyles.label);

        EditorGUILayout.Space();

        tabElements = GUILayout.Toolbar (tabElements, new string[] {"All", "1: 0"});
        switch (tabElements) {
            case 0:
                initAllTabUi();
            break;
            case 1:
                EditorGUILayout.Space();

                GUILayout.Label("Element 1", EditorStyles.label);

                EditorGUILayout.TextField("Title", "0");
                EditorGUILayout.Space();
                EditorGUILayout.TextArea("hello", GUILayout.Height(100));

                EditorGUILayout.Space();

                GUILayout.Label("Button 1", EditorStyles.label);

                EditorGUILayout.TextField("Title", "Desicion 1");
                EditorGUILayout.TextField("Go To", "1");

                GUILayout.BeginHorizontal();
        
                if (GUILayout.Button("Insert")) {
                    // add button code here
                }

                if (GUILayout.Button("Remove")) {
                    // remove button code here
                }

                GUILayout.EndHorizontal();

                EditorGUILayout.Space();

                GUILayout.Label("Button 2", EditorStyles.label);

                EditorGUILayout.TextField("Title", "Desicion 2");
                EditorGUILayout.TextField("Go To", "1");

                GUILayout.BeginHorizontal();
        
                if (GUILayout.Button("Insert")) {
                    // add button code here
                }

                if (GUILayout.Button("Remove")) {
                    // remove button code here
                }

                GUILayout.EndHorizontal();

                EditorGUILayout.Space();

                GUILayout.Label("Button 3", EditorStyles.label);

                EditorGUILayout.TextField("Title", "Desicion 3");
                EditorGUILayout.TextField("Go To", "3");

                GUILayout.BeginHorizontal();
        
                if (GUILayout.Button("Insert")) {
                    // add button code here
                }

                if (GUILayout.Button("Remove")) {
                    // remove button code here
                }

                GUILayout.EndHorizontal();

                EditorGUILayout.Space();

                GUILayout.Label("Button 4", EditorStyles.label);

                EditorGUILayout.TextField("Title", "Desicion 4");
                EditorGUILayout.TextField("Go To", "0");

                GUILayout.BeginHorizontal();
        
                if (GUILayout.Button("Add")) {
                    // add button code here
                }

                if (GUILayout.Button("Remove")) {
                    // remove button code here
                }

                GUILayout.EndHorizontal();
                EditorGUILayout.Space();
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
