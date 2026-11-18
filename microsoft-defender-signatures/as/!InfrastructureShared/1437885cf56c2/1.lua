-- Threat: !InfrastructureShared
-- Name: 1437885cf56c2
-- Type: 21

if peattributes.isdll and mp.get_mpattribute("BM_UnsignedDll") and mp.getfilesize() < 1048576 then
  return mp.INFECTED
end
return mp.CLEAN
