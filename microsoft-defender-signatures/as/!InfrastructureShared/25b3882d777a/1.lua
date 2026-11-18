-- Threat: !InfrastructureShared
-- Name: 25b3882d777a
-- Type: 21

local l_0_0 = string.lower(string.sub(bm.get_imagepath(), -10))
if l_0_0 == "\\lsass.exe" then
  mp.TriggerScanResource("rootkittelemetry", "")
  return mp.INFECTED
end
return mp.CLEAN
