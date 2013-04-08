/*
 * Verifies that grails scripts are symlinked correctly
 */
 import java.text.SimpleDateFormat

includeTargets << grailsScript("_GrailsBootstrap")
includeTargets << grailsScript("_GrailsDocs")

setDefaultTarget("packageDocs")

target(packageDocs: "Packages grails docs into an archive"){
  depends(docs)
  String buildDirName = new File("$basedir/target").name
  String fileName = new File(buildDirName, grailsAppName).name
  String date = new SimpleDateFormat("yyyyMMdd").format(new Date())
  String zipName = "$buildDirName/${fileName}-docs-${grailsAppVersion}-${date}.zip"

  grailsConsole.updateStatus "Creating documentation archive: ${zipName}"
  ant.zip(destfile: zipName, basedir: "$basedir/${buildDirName}", includes: "docs/**")
}
