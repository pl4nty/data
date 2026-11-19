-- Threat: !InfrastructureShared
-- Name: 9d2996df6437
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 2000 and 1000 < l_0_0 and mp.get_mpattribute("BM_TEXT_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
