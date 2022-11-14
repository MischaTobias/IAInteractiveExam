# Compilación

1. Para realizar la compilación y test de este proyecto de una forma correcta, se debe crear una nueva base de datos en SQL Server utilizando el Dump que se encuentra en la carpeta Dump&Postman.

2. Luego de ello, hay que modificar el archivo appsettings.json y en el connectionString de examIA hay que modificarlo para que tenga acceso a la base de datos. En mi caso, el nombre del servidor es DESKTOP-93MSEIJ y utilizo la autenticación de windos, por eso el Integrated Security=SSPI. Además, mi base de datos es la de IAExam. Para concretar la conexión con la db se utilizó la librería de System.Data.SqlClient.

3. Finalmente, se debe correr este proyecto en Visual Studio 2022 con .Net Core 6.

4. Luego de ejecutar el proyecto y que este levante completamente la interfaz de Swagger, se puede utilizar el mismo, o se puede importar la colección de POSTMAN que se encuentra en la carpeta Dump&Postman y ejecutar las pruebas con los datos pertinentes.
