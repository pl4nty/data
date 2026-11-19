-- Threat: !InfrastructureShared
-- Name: d178e759321a
-- Type: 21

if peattributes.isdll and mp.get_mpattribute("BM_UnsignedDll") and mp.getfilesize() < 163840 then
  return mp.INFECTED
end
return mp.CLEAN
