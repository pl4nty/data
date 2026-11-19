-- Threat: !InfrastructureShared
-- Name: 862974796d4c
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 4000 and mp.get_mpattribute("BM_TEXT_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
