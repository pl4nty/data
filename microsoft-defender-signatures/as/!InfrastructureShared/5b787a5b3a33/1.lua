-- Threat: !InfrastructureShared
-- Name: 5b787a5b3a33
-- Type: 21

if peattributes.isdll and mp.get_mpattribute("BM_UnsignedDll") and mp.getfilesize() < 512000 then
  return mp.INFECTED
end
return mp.CLEAN
