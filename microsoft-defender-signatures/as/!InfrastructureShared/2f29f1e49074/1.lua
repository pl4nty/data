-- Threat: !InfrastructureShared
-- Name: 2f29f1e49074
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 == nil or l_0_0 == 0 or 262144 < l_0_0 then
  return mp.CLEAN
end
if not mp.get_mpattribute("Implicit:FileExtEQ.yml") and not mp.get_mpattribute("Implicit:FileExtEQ.yaml") then
  return mp.CLEAN
end
mp.set_mpattribute("MpIsExhaustiveScriptScan")
return mp.INFECTED
