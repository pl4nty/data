-- Threat: !InfrastructureShared
-- Name: 4f78b1235b87
-- Type: 21

local l_0_0 = mp.getfilesize()
if not (peattributes.isdll and peattributes.hasexports and mp.get_mpattribute("BM_UnsignedDll")) or l_0_0 < 6291456 or 12582912 < l_0_0 then
  return mp.CLEAN
end
if pe.get_exports_count() ~= 3 then
  return mp.CLEAN
end
return mp.INFECTED
