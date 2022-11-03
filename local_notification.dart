class CustomLocalNotification {
  late FlutterLocalNotificationsPlugin localNotifications;
  late AndroidNotificationsDetails androidDetails;
  
  CustomLocalNotification() {
    localNotifications = FlutterLocalNotificationsPlugin();
    _setupNotification();
    );
  }
  
  _setupNotification() async{
    await initializeNotifications();
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
