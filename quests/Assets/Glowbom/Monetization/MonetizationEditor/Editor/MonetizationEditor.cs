#if UNITY_EDITOR
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

public class MonetizationEditor : EditorWindow
{
    static MonetizationLoader monetizationLoader = null;

    static MonetizationEditor()
    {
        monetizationLoader = new MonetizationLoader();
    }

    [MenuItem("Window/Glowbom/Monetization")]
    public static void ShowWindow()
    {
        GetWindow<MonetizationEditor>("Monetization");
    }

    private void OnGUI()
    {
        monetizationLoader.load();

        GUILayout.Label("Glowbom", EditorStyles.boldLabel);

        GUILayout.Label("Monetization", EditorStyles.label);

        EditorGUILayout.Space();

        if (GUILayout.Button("Save"))
        {
            monetizationLoader.save();
        }
    }
}
#endif
