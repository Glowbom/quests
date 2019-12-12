using UnityEngine;
using System.IO;

/*
 * Created on Sun Jul 28 2019
 *
 * Copyright (c) 2019 Glowbom.
 */
public class QuestLoader
{
    public Logic logic = null;
    public string name = "TemplateQuest";

    public void initialize() {
        if (logic == null) {
            load();
        }
    }

    public void load() {
        var textAsset = Resources.Load ("Data/" + name) as TextAsset;
        logic = JsonUtility.FromJson<Logic> (textAsset.text);
    }

    public void save() {
        try
        {
            using (StreamWriter sw = new StreamWriter("Assets/Glowbom/Quests/Resources/Data/" + name + ".txt", false))
            {
                sw.Write(JsonUtility.ToJson(logic));
            }
        }
        catch (IOException e)
        {
            Debug.Log(e.Message);
        }
        finally
        {
#if UNITY_EDITOR
            UnityEditor.AssetDatabase.Refresh();
#endif
        }
    }
}
