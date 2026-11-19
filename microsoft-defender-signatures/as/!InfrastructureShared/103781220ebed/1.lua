-- Threat: !InfrastructureShared
-- Name: 103781220ebed
-- Type: 21

if peattributes.isdll and mp.get_mpattribute("BM_UnsignedDll") and mp.getfilesize() < 512000 then
  return mp.INFECTED
end
return mp.CLEAN
