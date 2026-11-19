-- Threat: !InfrastructureShared
-- Name: 1a878177f44cf
-- Type: 21

if not peattributes.isdll or not mp.get_mpattribute("BM_UnsignedDll") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 20971520 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = pe.get_exports_count()
if l_0_1 < 60 then
  return mp.CLEAN
end
return mp.INFECTED
