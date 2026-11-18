-- Threat: !InfrastructureShared
-- Name: 16b78d3d1d5a7
-- Type: 21

if mp.get_mpattribute("BM_MZ_DLL") and mp.get_mpattribute("BM_UnsignedDll") and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
