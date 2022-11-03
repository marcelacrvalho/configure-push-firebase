class PushNotificationService {

    final CustomLocalNotification _customLocalNotification;

    PushNotificationService._internal(this._customLocalNotification);
    
    static final PushNotificationService _singleton = PushNotificationService._internal(CustomLocalNotification());
    factory PushNotificationService() => _singleton;

    Future<void> initialize() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationsOptions(badge: true, sound: true);
    
    FirebaseMessaging.onMessage.listen((message) {  // RECEBE UMA STREAM DE REMOTE MESSAGEM
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;

        if(notification != null && android != null)     
            _customLocalNotification(notification, android)
    }

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        //TODO: chamar a route espec
    });
    
    getTokenFirebase() {
        await FirebaseMessage.instance.getToken();
    }
  }
}
