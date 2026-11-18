-- Threat: !InfrastructureShared
-- Name: 3a782e7b4fab
-- Type: 21

if mp.get_mpattribute("HSTR:NSIS_Installer") or mp.get_mpattribute("HSTR:NSIS.gen!A") and mp.get_mpattribute("BM_HAS_DIGITALSIGNATURE") and peattributes.hasappendeddata == true then
  return mp.INFECTED
end
return mp.CLEAN
