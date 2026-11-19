-- Threat: !InfrastructureShared
-- Name: 19b3d1c75096
-- Type: 21

if not this_sigattrlog[1].matched or not this_sigattrlog[1].wp2 then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[1].utf8p2
if l_0_0 and not string.find(l_0_0:lower(), "\\amazon\\amazon assistant\\", 1, true) then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  MpCommon.SetPersistContextNoPath("mshta_start", l_0_1, 3)
end
return mp.CLEAN
