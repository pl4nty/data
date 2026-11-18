-- Threat: !InfrastructureShared
-- Name: 377879b020b3
-- Type: 21

if not (peattributes.isdll and mp.get_mpattribute("BM_UnsignedDll")) or mp.getfilesize() > 1048576 then
  return mp.CLEAN
end
if pe.get_exports_count() > 2 then
  return mp.CLEAN
end
return mp.INFECTED
