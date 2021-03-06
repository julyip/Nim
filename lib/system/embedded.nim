#
#
#            Nim's Runtime Library
#        (c) Copyright 2012 Andreas Rumpf
#
#    See the file "copying.txt", included in this
#    distribution, for details about the copyright.
#


# Bare-bones implementation of some things for embedded targets.

proc chckIndx(i, a, b: int): int {.inline, compilerproc.}
proc chckRange(i, a, b: int): int {.inline, compilerproc.}
proc chckRangeF(x, a, b: float): float {.inline, compilerproc.}
proc chckNil(p: pointer) {.inline, compilerproc.}

proc nimFrame(s: PFrame) {.compilerRtl, inl, exportc: "nimFrame".} = discard
proc popFrame {.compilerRtl, inl.} = discard

proc setFrame(s: PFrame) {.compilerRtl, inl.} = discard
proc pushSafePoint(s: PSafePoint) {.compilerRtl, inl.} = discard
proc popSafePoint {.compilerRtl, inl.} = discard
proc pushCurrentException(e: ref Exception) {.compilerRtl, inl.} = discard
proc popCurrentException {.compilerRtl, inl.} = discard

# some platforms have native support for stack traces:
const
  nativeStackTraceSupported = false
  hasSomeStackTrace = false

proc quitOrDebug() {.inline.} =
  quit(1)

proc raiseException(e: ref Exception, ename: cstring) {.compilerRtl.} =
  sysFatal(ENoExceptionToReraise, "exception handling is not available")

proc reraiseException() {.compilerRtl.} =
  sysFatal(ENoExceptionToReraise, "no exception to reraise")

proc writeStackTrace() = discard

proc setControlCHook(hook: proc () {.noconv.}) = discard
