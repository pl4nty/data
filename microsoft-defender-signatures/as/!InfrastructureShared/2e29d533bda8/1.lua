-- Threat: !InfrastructureShared
-- Name: 2e29d533bda8
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 == nil or l_0_0 == 0 or 65536 < l_0_0 then
  return mp.CLEAN
end
mp.set_mpattribute("MpIsExhaustiveScriptScan")
return mp.INFECTED
