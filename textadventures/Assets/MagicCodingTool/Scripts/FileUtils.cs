using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using UnityEngine;

namespace Assets.Scripts.Utils
{
    class FileUtils
    {
        public static void SafeWriteToFile(string content, string path)
        {
            try
            {
                using (
                    StreamWriter sw =
                        new StreamWriter(string.Concat(Application.persistentDataPath, "/", path), false))
                {
                    sw.Write(content);
                }
            }
            catch (IOException e)
            {
                Debug.Log(e.StackTrace);
            }
        }

        public static T LoadAndDeserialize<T>(string path)
        {
            Debug.Log("var save = default(T);");
            var save = default(T);
            try
            {
                Debug.Log("var fullPath = string.Concat(Application.persistentDataPath, path);");
                var fullPath = string.Concat(Application.persistentDataPath, "/", path);
                Debug.Log("if (File.Exists(fullPath))");
                if (File.Exists(fullPath))
                {
                    Debug.Log("using (var sr = new StreamReader(fullPath))");
                    using (var sr = new StreamReader(fullPath))
                    {
                        string data = sr.ReadToEnd();
                        Debug.Log(data);
                        save = JsonUtility.FromJson<T>(data);
                    }
                }
                Debug.Log("return save;");
                return save;
            }
            catch (IOException e)
            {
                Debug.Log("Debug.LogError(e.StackTrace);");
                Debug.LogError(e.StackTrace);
            }
            return default(T);
        }
    }


}
