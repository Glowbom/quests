#if UNITY_EDITOR
using UnityEngine;
using UnityEditor;

public class FeedbackEditor : EditorWindow
{
    public static string link = null;

    static FeedbackEditor()
    {       

    }

    [MenuItem("Window/Glowbom/Feedback")]
    public static void ShowWindow()
    {
        GetWindow<FeedbackEditor>("Feedback");
    }

    private void OnGUI()
    {

        GUILayout.Label("Glowbom", EditorStyles.boldLabel);

        GUILayout.Label("Feedback", EditorStyles.label);

        EditorGUILayout.Space();

        if (GUILayout.Button("Load"))
        {
            // get data from forms here
        }

        EditorGUILayout.Space();

        link = EditorGUILayout.TextField("Link", link);

        // put items after loading here!
    }
}
#endif
