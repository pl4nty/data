-- Threat: !InfrastructureShared
-- Name: 1c785b759004
-- Type: 21

if mp.get_mpattribute("BM_UnsignedDll") and mp.get_mpattribute("LUA:FileSizeLE4M.B") then
  return mp.INFECTED
end
return mp.CLEAN
