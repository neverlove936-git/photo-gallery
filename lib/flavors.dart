enum Flavor {
  development,
  production,
  staging,
}

class EnvValue {
  EnvValue({
    this.baseUrl = '',
    this.xApiKey = '',
  });
  String baseUrl;
  String xApiKey;
}

class Env {
  static Flavor? appFlavor;

  static EnvValue get value {
    switch (appFlavor) {
      case Flavor.development:
        return EnvValue(
          baseUrl: 'https://photoslibrary.googleapis.com/v1/',
        );
      case Flavor.production:
        return EnvValue();
      default:
        return EnvValue();
    }
  }
}
