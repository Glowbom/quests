using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

/*
 * Created on Sun Jul 21 2019
 *
 * Copyright (c) 2019 Glowbom, Inc.
 */
public class QuestEditor : EditorWindow
{   
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
    private void OnGUI()
    {
        questLoader.initialize();

        GUILayout.Label("Glowbom", EditorStyles.boldLabel);

        GUILayout.Label("Quests", EditorStyles.label);

        EditorGUILayout.Space();

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

        EditorGUILayout.Space();

        // main quest

        GUILayout.BeginVertical(EditorStyles.helpBox);

        EditorGUILayout.Space();

        GUILayout.Label("Project 1", EditorStyles.label);

        EditorGUILayout.Space();

        tabElements = GUILayout.Toolbar (tabElements, new string[] {"All", "1: 0"});
        switch (tabElements) {
            case 0:
                EditorGUILayout.Space();

                if (GUILayout.Button("1: 0")) {
                    // login code here
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

                if (GUILayout.Button("2: Welcome")) {
                    // login code here
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

                if (GUILayout.Button("3: No Way")) {
                    // login code here
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

                if (GUILayout.Button("4: 3")) {
                    // login code here
                }

                GUILayout.BeginHorizontal();
                if (GUILayout.Button("Add")) {
                    // add button code here
                }

                if (GUILayout.Button("Remove")) {
                    // remove button code here
                }
                GUILayout.EndHorizontal();

                EditorGUILayout.Space();

                EditorGUILayout.Space();
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

        // more quests

        GUILayout.BeginVertical(EditorStyles.helpBox);

        EditorGUILayout.Space();

        GUILayout.Label("Projects", EditorStyles.label);

        EditorGUILayout.Space();

        GUILayout.EndVertical();

        EditorGUILayout.Space();

        // templates

        GUILayout.BeginVertical(EditorStyles.helpBox);

        EditorGUILayout.Space();

        GUILayout.Label("Templates", EditorStyles.label);

        EditorGUILayout.Space();

        GUILayout.EndVertical();

        EditorGUILayout.Space();
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
