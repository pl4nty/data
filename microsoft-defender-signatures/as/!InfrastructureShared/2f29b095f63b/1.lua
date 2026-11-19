-- Threat: !InfrastructureShared
-- Name: 2f29b095f63b
-- Type: 21

if mp.getfilesize() < 2097152 then
  mp.set_mpattribute("MpIsExhaustiveScriptScan")
  mp.set_mpattribute("NScript:NoParsingLimits")
  return mp.INFECTED
end
return mp.CLEAN
