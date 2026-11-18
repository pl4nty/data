-- Threat: !InfrastructureShared
-- Name: 10778c7d30395
-- Type: 21

if mp.get_mpattribute("HSTR:NSIS_Installer") or mp.get_mpattribute("HSTR:NSIS.gen!A") and mp.get_mpattribute("BM_HAS_DIGITALSIGNATURE") then
  return mp.INFECTED
end
return mp.CLEAN
