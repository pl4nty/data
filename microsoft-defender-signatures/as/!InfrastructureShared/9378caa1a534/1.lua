-- Threat: !InfrastructureShared
-- Name: 9378caa1a534
-- Type: 21

if peattributes.isdll and mp.get_mpattribute("BM_UnsignedDll") and mp.getfilesize() < 1048576 then
  return mp.INFECTED
end
return mp.CLEAN
