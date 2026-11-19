-- Threat: !InfrastructureShared
-- Name: 21d0753d95c5
-- Type: 21

local l_0_0 = mp.getfilename()
if string.find(string.lower(l_0_0), ".asar$") ~= nil then
  mp.set_mpattribute("MpIsExhaustiveScriptScan")
  return mp.INFECTED
end
return mp.CLEAN
