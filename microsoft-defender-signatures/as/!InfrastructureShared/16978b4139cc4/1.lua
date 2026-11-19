-- Threat: !InfrastructureShared
-- Name: 16978b4139cc4
-- Type: 21

if mp.get_mpattribute("BM_MZ_DLL") and mp.get_mpattribute("BM_UnsignedDll") and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
