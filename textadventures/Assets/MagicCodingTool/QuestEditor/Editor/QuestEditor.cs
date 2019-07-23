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
    [MenuItem("Window/Glowbom/Quests")]
    public static void ShowWindow() {
        GetWindow<QuestEditor> ("Quests");
    }
    private void OnGUI()
    {
        GUILayout.Label("Glowbom", EditorStyles.boldLabel);

        GUILayout.Label("Quests", EditorStyles.label);

        EditorGUILayout.Space();

        GUILayout.BeginVertical(EditorStyles.helpBox);

        EditorGUILayout.Space();

        GUILayout.Label("Cloud Storage", EditorStyles.label);

        EditorGUILayout.Space();

        GUILayout.Label("Glowbom Account", EditorStyles.label);

        EditorGUILayout.Space();

        EditorGUILayout.TextField("Login", "");
        EditorGUILayout.TextField("Password", "");

        EditorGUILayout.Space();

         if (GUILayout.Button("Login")) {
            // login code here
        }

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
