/*
 * Verifies that grails scripts are symlinked correctly
 */
 import java.text.SimpleDateFormat

includeTargets << grailsScript("_GrailsBootstrap")
includeTargets << grailsScript("_GrailsDocs")

buildDirName = 'target'

target(default: "Packages grails docs into an archive"){
  depends(docs,checkVersion)

  String fileName = new File(basedir, buildDirName).name
  String date = new SimpleDateFormat("ddMMyyy").format(new Date())
  String zipName = "$basedir/${fileName}-docs-${date}.zip"

  //def ignore = "[Start] Packaging Docs"?.grom()
  ant.zip(destfile: zipName, basedir: "$basedir/${buildDirName}", includes: "docs/**")
  //ignore = "[End] Packaging Docs"?.grom()

}
