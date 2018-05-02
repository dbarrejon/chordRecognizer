En el siguiente documento describimos cómo debe usarse nuestro código del proyecto para la asignatura Tratamiento de Información Multimedia de la Universidad Carlos III de Madrid:\


# jim2012Chords\

Esta carpeta contiene la base de datos de acordes, pero modificada para nuestro problema. \
Subconjunto 1 -> Carpetas Noisefree y Noisy\
Subconjunto 2 -> Carpeta Other_Instruments\

En caso de querer acceder a la base de datos original, este es el enlace: {\field{\*\fldinst{HYPERLINK "http://www.montefiore.ulg.ac.be/services/acous/STSI/file/jim2012Chords.zip"}}{\fldrslt 
\f1\fs32 \cf2 \cb3 \expnd0\expndtw0\kerning0
http://www.montefiore.ulg.ac.be/services/acous/STSI/file/jim2012Chords.zip}}
\f1\fs32 \cf2 \cb3 \expnd0\expndtw0\kerning0
 
\fs24 \cf4 \cb1 \

\f0 \cf0 \kerning1\expnd0\expndtw0 \
\
# src
# MAT-Files
Los archivos .mat son aquellos structs de los conjuntos que hemos usado para evaluar los resultados de nuestros clasificadores. Los resultados de la memoria del proyecto han sido obtenidos con estos structs.
IMPORTANTE: Si se ejecuta la función load_sets.m, estos archivos serán sobrescritos.

## Funciones
audio_dft.m -> Esta función calcula la DFT del acorde correspondiente.
pcp.m -> Esta función calcula el vector PCP de caracterísitcas.
multisv.m -> Esta función entrena y clasifica una sim muticlase. Además, podemos especificar el valor de sigma del kernel rtf gausiano.
labeler.m -> Esta función genera las etiquetas de los acordes para que puedan ser utilizados en la clasificación. El etiquetado es numérico del 1 al 10.
ideal_pcp.m -> Esta función genera una matriz donde cada fila es un acorde ideal de nuestro rango de acordes.

# Script

example_pcp.m -> Ejemplo básico de dos acordes de La, sin ruido y con ruido.
samples_vs_ideal.m -> Ejemplo en el que mostramos una comparativa entre los acordes ideales y los acordes de nuestra base de datos.
load_sets.m -> Este script se encarga de generar los diferentes conjuntos de entrenamiento y de test que vamos a utilizar en nuestros experimentos. Estos conjuntos se guardan como .mat para poder ser utilizados en la clasificación.
KNN_confmat -> Primera implementaciónn del KNN donde realizamos una optimizaciónn del parámetro K. Tras muchas iteraciones el parámetro más óptimo fue K=1.
oneNN_confmat.m -> Implementación final de la clasificación con un KNN con K=1.
cv_multisvm.m -> Script que permite obtener la sigma más optima para nuestra SVM. Hacemos una validación cruzada de 5 iteraciones.
SVM_confmat -> Implementación final de la clasificación con una SVM con sigma=2.35.
