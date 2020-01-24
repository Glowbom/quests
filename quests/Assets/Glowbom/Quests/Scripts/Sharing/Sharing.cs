using System.Runtime.InteropServices;
using UnityEngine;

/*
 * Created on Fri Jun 24 2020
 *
 * Copyright (c) 2020 Glowbom.
 */
public class Sharing : MonoBehaviour
{
#if UNITY_IOS

    [DllImport("__Internal")]
    private static extern void _shareMessage(string message, string url);

    public static void shareMessage(string message, string url = "")
    {
        _shareMessage(message, url);
    }

#else

    public static void shareMessage(string message, string url = "")
    {
        Debug.LogError("sharing is not supported on this platform.");
    }

#endif
}
