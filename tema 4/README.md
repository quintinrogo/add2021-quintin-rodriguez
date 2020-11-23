## 2.4 Comprobamos el acceso al contenido del LDAP

* ldapsearch -b "dc=ldap08,dc=curso2021" -x | grep dn, muestra el contenido de nuestra base de datos LDAP. "dn" significa nombre distiguido, es un identificador que tiene cada nodo dentro del árbol LDAP.

* ldapsearch -H ldap://localhost -b "dc=ldap08,dc=curso2021" -W -D "cn=Directory Manager" | grep dn, en este caso hacemos la consulta usando usuario/clave.

![](4.png)

Parámetro 	Descripción

-x 	No se valida usuario/clave

-b "dc=ldap42,dc=curso2021" 	Base/sufijo del contenido

-H ldap://localhost:389 	IP:puerto del servidor

-W 	Se solicita contraseña

-D "cn=Directory Manager" 	Usuario del LDAP
