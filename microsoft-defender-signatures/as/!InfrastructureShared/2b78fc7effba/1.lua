-- Threat: !InfrastructureShared
-- Name: 2b78fc7effba
-- Type: 21

if peattributes.isdll and mp.get_mpattribute("BM_UnsignedDll") and mp.getfilesize() < 512000 then
  return mp.INFECTED
end
return mp.CLEAN
