# my_task_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

# this app using design is 

design link =  https://www.figma.com/design/sKxe0DE6AgaX4u0riafAct/    Learn-UIUX-%3A-To-Do-List-App-(Community)?node-id=0-1&p=f&t=SeVkomsLxduMZjQe-0

the first part of i do  i  creat a project then intiolise of git and commit this 

and pages is not compled home page is almoast done 
using therdparty liobrery is screenutilinit
and googlefonts 

the googlefonts llibrery make the erorr the gradle version is make conflict

# the erorr is  

What went wrong:
Execution failed for task ':path_provider_android:compileDebugJavaWithJavac'.
> Could not resolve all files for configuration ':path_provider_android:androidJdkImage'.
   > Failed to transform core-for-system-modules.jar to match attributes {artifactType=_internal_android_jdk_image, org.gradle.libraryelements=jar, org.gradle.usage=java-runtime}.


# fixed the erorr 

i chnging this

app\build.gradle:

android {
  ndkVersion "25.1.8937393"
}

compileOptions {
  sourceCompatibility JavaVersion.VERSION_17
  targetCompatibility JavaVersion.VERSION_17
}
kotlinOptions {
  jvmTarget = 17
}
This in settings.gradle:

id "com.android.application" version "8.3.2" apply false
id "org.jetbrains.kotlin.android" version "2.0.20" apply false


And this in gradle-wrapper.properties:

distributionUrl=https\://services.gradle.org/distributions/gradle-8.10.2-all.zip


creat loadmore and the two textfield the title and discription
