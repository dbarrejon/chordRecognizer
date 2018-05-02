En el siguiente documento describimos cómo debe usarse nuestro código del proyecto para la asignatura Tratamiento de Información Multimedia de la Universidad Carlos III de Madrid:\


# jim2012Chords\
*****************************************************************************************************************************************************************************************************************************************************************************\
Esta carpeta contiene la base de datos de acordes, pero modificada para nuestro problema. \
Subconjunto 1 -> Carpetas Noisefree y Noisy\
Subconjunto 2 -> Carpeta Other_Instruments\
\
En caso de querer acceder a la base de datos original, este es el enlace: {\field{\*\fldinst{HYPERLINK "http://www.montefiore.ulg.ac.be/services/acous/STSI/file/jim2012Chords.zip"}}{\fldrslt 
\f1\fs32 \cf2 \cb3 \expnd0\expndtw0\kerning0
http://www.montefiore.ulg.ac.be/services/acous/STSI/file/jim2012Chords.zip}}
\f1\fs32 \cf2 \cb3 \expnd0\expndtw0\kerning0
 
\fs24 \cf4 \cb1 \

\f0 \cf0 \kerning1\expnd0\expndtw0 \
\
src\
*****************************************************************************************************************************************************************************************************************************************************************************\
MAT-Files\
\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\
Los archivos .mat son aquellos structs de los conjuntos que hemos usado para evaluar los resultados de nuestros clasificadores. Los resultados de la memoria del proyecto han sido obtenidos con estos structs.\
IMPORTANTE: Si se ejecuta la funci\'f3n load_sets.m, estos archivos ser\'e1n sobrescritos. \
\
\
Funciones\
\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\
audio_dft.m -> Esta funci\'f3n calcula la DFT del acorde correspondiente.\
\
pcp.m -> Esta funci\'f3n calcula el vector PCP de caracter\'edsitcas\
\
multisv.m -> Esta funci\'f3n entrena y clasifica una sim muticlase. Adem\'e1s, podemos especificar el valor de sigma del kernel rtf gausiano.\
\
labeler.m -> Esta funci\'f3n genera las etiquetas de los acordes para que puedan ser utilizados en la clasificaci\'f3n. El etiquetado es num\'e9rico del 1 al 10.\
\
ideal_pcp.m -> Esta funci\'f3n genera una matriz donde cada fila es un acorde ideal de nuestro rango de acordes.\
\
\
Script\
\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\
example_pcp.m -> Ejemplo b\'e1sico de dos acordes de La, sin ruido y con ruido.\
\
samples_vs_ideal.m -> Ejemplo en el que mostramos una comparativa entre los acordes ideales y los acordes de nuestra base de datos.\
\
load_sets.m -> Este script se encarga de generar los diferentes conjuntos de entrenamiento y de test que vamos a utilizar en nuestros experimentos. Estos conjuntos se guardan como .mat para poder ser utilizados en la clasificaci\'f3n. \
\
KNN_confmat -> Primera implementaci\'f3n del KNN donde realizamos una optimizaci\'f3n del par\'e1metro K. Tras muchas iteraciones el par\'e1metro m\'e1s \'f3ptimo fue K=1.\
\
oneNN_confmat.m -> Implementaci\'f3n final de la clasificaci\'f3n con un KNN con K=1.\
\
cv_multisvm.m -> Script que permite obtener la sigma m\'e1s optima para nuestra SVM. Hacemos una validaci\'f3n cruzada de 5 iteraciones. \
\
SVM_confmat -> Implementaci\'f3n final de la clasificaci\'f3n con una SVM con sigma=2.35.\
\
\
figures\
*****************************************************************************************************************************************************************************************************************************************************************************\
Esta carpeta contiene las diferentes figuras de los experimentos y pruebas que hemos hecho guardadas como .fig. \
\
\
\
\
\
\
\
\
}
