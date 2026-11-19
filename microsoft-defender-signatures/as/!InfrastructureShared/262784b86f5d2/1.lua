-- Threat: !InfrastructureShared
-- Name: 262784b86f5d2
-- Type: 21

if peattributes.isdll and mp.get_mpattribute("BM_UnsignedDll") and mp.getfilesize() < 20971520 then
  return mp.INFECTED
end
return mp.CLEAN
