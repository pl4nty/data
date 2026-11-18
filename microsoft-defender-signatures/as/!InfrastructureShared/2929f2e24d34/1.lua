-- Threat: !InfrastructureShared
-- Name: 2929f2e24d34
-- Type: 21

local l_0_0 = mp.getfilename()
if l_0_0 == nil or not string.find(l_0_0, "%.sh$") then
  return mp.CLEAN
end
mp.set_mpattribute("MpIsExhaustiveScriptScan")
return mp.INFECTED
