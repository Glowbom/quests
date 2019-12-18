using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using GoogleMobileAds.Api;

/*
 * Created on Mon Dec 16 2019
 *
 * Copyright (c) 2019 Glowbom.
 */
[System.Serializable]
public class Monetization : MonoBehaviour
{
    public string androidBanner;
    public string androidInterstitial;
    public string androidAppId;

    public string iOSBanner;
    public string iOSInterstitial;
    public string iOSAppId;
    public int showAdsIn = 6;

    private int adCounter = 0;

    private BannerView bannerView;
    private InterstitialAd interstitial;

    private void requestBanner()
    {
#if UNITY_ANDROID
        string adUnitId = androidBanner;
#elif UNITY_IPHONE
        string adUnitId = iOSBanner;
#else
        string adUnitId = "unexpected_platform";
#endif

        // Create a 320x50 banner at the top of the screen.
        this.bannerView = new BannerView(adUnitId, AdSize.Banner, AdPosition.BottomRight);

        // Create an empty ad request.
        AdRequest request = new AdRequest.Builder().Build();

        // Load the banner with the request.
        this.bannerView.LoadAd(request);
    }

    private void requestInterstitial()
    {
#if UNITY_ANDROID
        string adUnitId = androidInterstitial;
#elif UNITY_IPHONE
        string adUnitId = iOSInterstitial;
#else
        string adUnitId = "unexpected_platform";
#endif

        // Initialize an InterstitialAd.
        this.interstitial = new InterstitialAd(adUnitId);
        // Create an empty ad request.
        AdRequest request = new AdRequest.Builder().Build();
        // Load the interstitial with the request.
        this.interstitial.LoadAd(request);
    }

    public void destroy()
    {
        if (interstitial != null)
        {
            interstitial.Destroy();
        }
    }

    public void showInterstitial()
    {
        if (interstitial == null)
        {
            requestInterstitial();
        }

        if (interstitial != null && this.interstitial.IsLoaded())
        {
            interstitial.Show();

            showBanner();
        }
    }

    public void showBanner()
    {
        requestBanner();
    }

    public void initAds()
    {
#if UNITY_ANDROID
        string appId = androidAppId;
#elif UNITY_IPHONE
        string appId = iOSAppId;
#else
        string appId = "unexpected_platform";
#endif

        // Initialize the Google Mobile Ads SDK.
        MobileAds.Initialize(appId);
    }

    public void tryShowAds()
    {
        ++adCounter;
        if (adCounter % showAdsIn == 0)
        {
            showInterstitial();
        }

        if (adCounter > 100)
        {
            adCounter = 0;
        }
    }
}
