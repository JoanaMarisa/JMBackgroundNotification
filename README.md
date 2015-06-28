# JMBackgroundNotification

##Features Includes

- Objective-C
- Singleton


##When to implement?

- Where you want to verify is the application is active or in background


##How to implement?

 - O padrão Singleton foi utilizado para que uma variável BOOL, em que o seu valor significava que a aplicação se encontrava em background ou não, fosse instanciada apenas uma única vez e pudesse ser acedida em qualquer parte do código. Como o processo de monitorização decorre mesmo que a aplicação se encontre em background é importante que a aplicação tenha conhecimento do seu estado para que, se em modo background detetar um iBeacon, envie uma notificação com uma mensagem. Na classe AppDelegate, existe o método: - (void)applicationDidEnterBackground:(UIApplication*)application e o método -(void)applicationDidBecomeActive:(UIApplication *) application que são invocados quando a aplicação entre em modo background ou se torna ativa, respetivamente. Nestes métodos, a variável BOOL referida anteriormente é alterada, como ilustrada no Código 1, dependendo de se a aplicação entrou em modo background ou não. Sempre que necessário conhecer o estado da aplicação, é possível aceder ao valor dessa BOOL através do código presente no Código 2.


##InBackgroundManager *sharedSingleton = [InBackgroundManager sharedManager]; 
##[sharedSingleton setInBackground:YES];
 - Código 1 – Código responsável pela alteração do valor da BOOL


##InBackgroundManager *sharedSingleton = [InBackgroundManager sharedManager]; 
##self.back = [sharedBackground inBackground];
- Código 2 – Código responsável por retornar o valor da BOOL


- Na versão final da aplicação, este padrão não se encontra aplicado para esta verificação pois, o método - (void)locationManager:(CLLocationManager *)manager didDetermineState:(CLRegionState)state forRegion:(CLRegion *)region foi implementado. Este método é responsável por determinar as transições do dispositivo móvel para dentro ou fora da região quando a aplicação não se encontra em execução. Quando isto acontece, a aplicação torna-se ativa momentaneamente, é invocado o método delegate e é enviada uma notificação local com a mensagem respetiva, caso a aplicação não esteja. No entanto, a classe CoreDataManager utiliza este padrão porque só se deve inicializar uma vez o conteúdo da base de dados local. O excerto de Código 3, é utilizado para todas as classes que implementem o padrão Singleton para que apenas seja criada uma instância dessa classe e que a mesma seja partilhada em todo o código do projeto. É definida uma variável estática _sharedInstance, que é inicializada uma e uma só vez no método +(CoreDataManager *)sharedInstance;. Sempre que for necessário fazer a referência a esta classe faz-se como ilustrado anteriormente no Código 1 e Código 2.


##pragma mark - Singleton
##-(id)init
##{
##      @throw @"";
##}
##-(id)initPrivate
##{
##      self= [super init];
##      if (self)
##      {
##
##      }
##      return self;
##}
##static CoreDataManager *_sharedInstance;
##+(CoreDataManager *)sharedInstance
##{
##      @synchronized(self) 
##      {
##        if( _sharedInstance == nil ) 
##        {
##          _sharedInstance = [[CoreDataManager alloc ] initPrivate ]; 
##        }
##      }
##      return _sharedInstance; 
##}
- Código 3 – Excerto de código relativo à implementação do padrão Singleton.


