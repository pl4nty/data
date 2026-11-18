-- Threat: !InfrastructureShared
-- Name: 4661bf6a9c55
-- Type: 21

if mp.get_mpattribute("BM_DEVICE_DRIVER") and mp.get_mpattribute("BM_MZ_DLL") then
  return mp.INFECTED
end
return mp.CLEAN
