-- Threat: !#MpIsExhaustiveScriptScan
-- Type: 13
-- MpAttributes: SCRIPT:TrojanDropper:AutoIt/Binder1 & SCRIPT:TrojanDropper:AutoIt/Binder3 & SCRIPT:AutoItNoTray & SCRIPT:AutoItObfus1

if mp.getfilesize() > 3000000 then
  return mp.CLEAN
end
return mp.INFECTED
