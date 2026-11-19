-- Threat: !InfrastructureShared
-- Name: 4661f66fbb67
-- Type: 21

if peattributes.isdll and mp.get_mpattribute("BM_UnsignedDll") then
  return mp.INFECTED
end
return mp.CLEAN
