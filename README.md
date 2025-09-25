CalculaYa! ✏️

CalculaYa! es una aplicación web en Flutter que te permite realizar operaciones matemáticas básicas de forma rápida y visual. Ideal para quienes quieren cálculos sencillos en un entorno moderno y estilizado.

🚀 Características principales

Suma, resta, multiplicación y división

Interfaz moderna con esquema de colores oscuros

Indicadores visuales y diseño responsivo

Manejo de errores (por ejemplo, división por cero)

Experiencia fluida con navegación nativa entre pantallas

🛠️ Tecnologías usadas

Flutter (soporte web)

Dart (lógica de negocio)

Widgets estándar de Material

Sin dependencias externas complejas

📦 Instalación y ejecución local

Clona este repositorio:

git clone https://github.com/carforck/CalculaYa.git
cd CalculaYa


Asegúrate de tener Flutter instalado y configurado para web.
(Verifica con flutter doctor)

Ejecuta la aplicación en modo desarrollo (web):

flutter run -d chrome


Esto abrirá la app en tu navegador para pruebas locales.

🌐 Despliegue en GitHub Pages

Para publicar tu aplicación en GitHub Pages, sigue estos pasos:

Genera la versión web con la ruta base correcta:

flutter build web --release --base-href "/CalculaYa/"


Copia los archivos generados al directorio docs/:

rm -rf docs
mkdir docs
cp -r build/web/* docs/


Haz commit y push al repositorio:

git add docs
git commit -m "Deploy web build"
git push origin main


Ve a Settings → Pages en GitHub, y selecciona:

Branch: main

Folder: /docs

Tras unos minutos, tu app estará disponible en:

https://carforck.github.io/CalculaYa/

🎯 Estructura del proyecto
CalculaYa/
├── lib/
│   └── main.dart        ← código fuente principal
├── build/               ← contiene los builds generados
├── docs/                ← archivos estáticos que servirás con Pages
├── pubspec.yaml         ← dependencias y configuración Flutter
└── README.md            ← este archivo

🧪 Pruebas y mejoras futuras

Agregar validaciones más robustas (por ejemplo, manejo de entradas no numéricas)

Soporte para más operaciones (potencia, raíz, etc.)

Internacionalización (i18n)

Mejorar accesibilidad y UI para móviles

👤 Autor

Carforck
Repositorio: https://github.com/carforck/CalculaYa