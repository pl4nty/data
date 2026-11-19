-- Threat: !InfrastructureShared
-- Name: 5f78d7a26875
-- Type: 21

if not peattributes.isdll or not mp.get_mpattribute("BM_UnsignedDll") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 20971520 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
