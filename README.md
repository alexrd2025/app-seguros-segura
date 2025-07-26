# App Seguros Segura

<<<<<<< HEAD
Sistema digital con:
- Firma RSA desde móvil
- Validación en servidor
- Envío por correo

=======
Sistema completo de gestión de seguros con firma digital para dispositivos móviles y validación en el servidor.

---

## 🧩 Módulos principales:

### 📱 Aplicación Flutter (`flutter_app/`)

- Registro de pólizas de seguros
- Firma digital RSA (clave generada en el móvil)
- Hash SHA-256 de los datos firmados
- Almacenamiento local seguro de claves
- Envío automático por correo al servidor

---

### 💻 Verificador de servidor (`backend/`)

- Script en Python para validar la firma digital
- Uso de clave pública enviada por el agente
- Integración con base de datos PostgreSQL
- Puede integrarse con sistema contable mediante `.cyp`

---

## 🔐 Seguridad

- Cada agente genera un par de claves (privada/pública)
- Solo se guarda la **clave pública** en el servidor
- El hash de los datos se firma localmente
- La firma puede validarse en el backend antes de aceptar los datos
>>>>>>> 65e009078d1c2350c3279a3101e996a8928d4a8d
