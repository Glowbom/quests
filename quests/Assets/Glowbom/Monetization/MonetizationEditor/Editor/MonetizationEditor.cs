#if UNITY_EDITOR
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

public class MonetizationEditor : EditorWindow
{
    static MonetizationEditor()
    {
    }

    [MenuItem("Window/Glowbom/Monetization")]
    public static void ShowWindow()
    {
        GetWindow<MonetizationEditor>("Monetization");
    }

    private void OnGUI()
    {
        GUILayout.Label("Glowbom", EditorStyles.boldLabel);

        GUILayout.Label("Monetization", EditorStyles.label);

        EditorGUILayout.Space();
    }
}
#endif
