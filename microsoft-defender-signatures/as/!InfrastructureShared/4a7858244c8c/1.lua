-- Threat: !InfrastructureShared
-- Name: 4a7858244c8c
-- Type: 21

if peattributes.isdll and mp.get_mpattribute("BM_UnsignedDll") then
  return mp.INFECTED
end
return mp.CLEAN
