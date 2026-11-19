-- Threat: !InfrastructureShared
-- Name: 6978ea87d111
-- Type: 21

if not (peattributes.isdll and mp.get_mpattribute("BM_UnsignedDll")) or not mp.get_mpattribute("pea_hasexports") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 2097152 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
