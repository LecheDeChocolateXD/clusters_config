$host = 'localhost';
    $port = '3306';
    $db = 'database_name';
    $user = 'username';
    $password = 'password';

    $dsn = "mysql:host=$host;port=$port;dbname=$db;charset=utf8mb4";
    $options = [
      PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
      PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
      PDO::MYSQL_ATTR_SSL_CA => '/path/to/ca-cert.pem', // ruta al archivo del certificado de la entidad de certificación
      PDO::MYSQL_ATTR_SSL_VERIFY_SERVER_CERT => true // verificar el certificado del servidor
    ];

    try {
      $pdo = new PDO($dsn, $user, $password, $options);
    } catch(PDOException $e) {
      die("Error al conectar: " . $e->getMessage());
    }

