-- Threat: \xac!Extrac32Abuse.A
-- Type: 13
-- MpAttributes: SCPT:Extrac32RelativePathAbuse

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_0 ~= "extrac32.exe" then
  return mp.CLEAN
end
return mp.INFECTED
