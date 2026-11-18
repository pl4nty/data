-- Threat: !InfrastructureShared
-- Name: 2678c631d598
-- Type: 21

if not (peattributes.isdll and mp.get_mpattribute("BM_UnsignedDll")) or mp.getfilesize() > 204800 then
  return mp.CLEAN
end
return mp.INFECTED
