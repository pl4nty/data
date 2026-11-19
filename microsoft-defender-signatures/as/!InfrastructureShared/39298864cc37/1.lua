-- Threat: !InfrastructureShared
-- Name: 39298864cc37
-- Type: 21

local l_0_0 = mp.getfilename()
if l_0_0 == nil or not string.find(l_0_0, "%.py$") then
  return mp.CLEAN
end
mp.set_mpattribute("MpIsExhaustiveScriptScan")
return mp.INFECTED
