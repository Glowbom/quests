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
    public Buttons buttonsLogic = null;
    public string name = "TemplateQuest";

    public void initialize() {
        if (logic == null) {
            load();
        }
    }

    public void loadButtonsLogic()
    {
        var textAsset = Resources.Load("Data/Buttons") as TextAsset;
        buttonsLogic = JsonUtility.FromJson<Buttons>(textAsset.text);
        Debug.Log(textAsset.text);
    }

    public void load() {
        var textAsset = Resources.Load ("Data/" + name) as TextAsset;
        logic = JsonUtility.FromJson<Logic> (textAsset.text);
        loadButtonsLogic();
    }

    public void save() {
        try
        {
            using (StreamWriter sw = new StreamWriter("Assets/Glowbom/Quests/Resources/Data/" + name + ".txt", false))
            {
                sw.Write(JsonUtility.ToJson(logic));
            }

            using (StreamWriter sw = new StreamWriter("Assets/Glowbom/Quests/Resources/Data/Buttons.txt", false))
            {
                sw.Write(JsonUtility.ToJson(buttonsLogic));
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
