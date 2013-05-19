/**
 * Some helpful grails script hooks
 */

 // -----[ Growl Notification ]-----

// App Start/Stop
eventAppLoadStart = { msg -> msg?.grom() }
eventAppLoadEnd = { msg -> msg?.grom() }

// Testing
eventTestPhaseStart = { msg -> "Test phase start: ${msg}"?.grom() }
eventTestPhaseEnd = { msg -> "Test phase start: ${msg}"?.grom() }

// Errors
eventStatusError = { msg -> "ERROR: ${msg}"?.grom() }

// Build
statusExiting = { code -> "Success: ${code}"?.grom() }
statusCompileStart = { kind -> "Compile Start: ${kind}"?.grom() }
statusCompileEnd = { kind -> "Compile End: ${kind}"?.grom() }
statusPackgingEnd = { "Finished Packaging"?.grom() }

// Docs
statusDocStart = { kinde -> "Doc Start: ${kind}"?.grom() }
statusDocEnd = { kinde -> "Doc End: ${kind}"?.grom() }


