class CustomLocalNotification {
  late FlutterLocalNotificationsPlugin localNotifications;
  late AndroidNotificationChannel channel;
  
  CustomLocalNotification() {
   channel = const AndroidNotificationChannel(
     'high_importance_channel',
     'High Importance Notifications'
     description: 'Channel for Android Notifications',
     importance: Importance.max,
   );
    
    _configureAndroid().then(
      (value) {
        localNotifications = value;
        initializeNofitications();
      }
    )
  }
  
  initializeNotifications() {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@drawable/ic_launcher');
    
    const DarwinInitializationSettings iOSSettings =
        DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );
    
    await localNotifications.initialize(
      const InitializeSettings(
        android: androidSettings,
        iOS: iOSSettings,
      ),
      onSelectNotification: _onSelectedNotification,
    );
  }
  
  _onSelectedNotification() {
    if(payLoad){}
  }
  
}
