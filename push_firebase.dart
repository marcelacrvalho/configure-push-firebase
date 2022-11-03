// 1. importar os packages flutter local notifications, firebase messaging e firebase core
// 2. Cria uma classe para poder conversar com as notificações que serão recebidas do firebase, de forma remota


class PushNotificationService {

    final CustomLocalNotification _customLocalNotification;

    PushNotificationService._internal(this._customLocalNotification);
    
    static final PushNotificationService _singleton = PushNotificationService._internal(CustomLocalNotification());
    factory PushNotificationService() => _singleton; // TODA VEZ QUE EU CHAMAR A MINHA FACTORY, ELA RECUPERA A INSTANCIA DO SIGLETON

    Future<void> initialize() async {
    // COMO MINHA APLICAÇÃO APARECERÁ PARA O USUÁRIO, com BADGE, SOM, IMAGEM, etc  
    await FirebaseMessaging.instance.setForegroundNotificationPresentationsOptions(badge: true, sound: true);
    
    // QUANDO O USER RECEBER A MENSAGEM, O QUE O APP FARÁ
    FirebaseMessaging.onMessage.listen((message) {  // RECEBE UMA STREAM DE REMOTE MESSAGEM
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;

        if(notification != null && android != null)     
            _customLocalNotification(notification, android)
    }

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // FAZ ALGUMA COISA AQUI QUANDO O USUÁRIO ABRE A MENSAGEM. ENVIA PARA UMA ROTA OU
        VERIFICA SE (message.data['chave-escolhida'] == chave) PRA PODER ENVIAR PRA UMA ROTA
    });
    
    getTokenFirebase() {
        await FirebaseMessage.instance.getToken(); /* GUARDA ESSE TOKEN EM UM BD PARA PODER
                                                    CONVERSAR COM O USER QUANDO FOR NECESSÁRIO */
    }
  }
}
