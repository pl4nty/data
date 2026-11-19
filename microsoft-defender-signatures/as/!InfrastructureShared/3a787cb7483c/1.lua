-- Threat: !InfrastructureShared
-- Name: 3a787cb7483c
-- Type: 21

if peattributes.is_process then
  return mp.CLEAN
end
if mp.get_mpattribute("pea_epscn_writable") and mp.get_mpattribute("pea_lastscn_executable") and mp.get_mpattribute("pea_firstsectwritable") and mp.get_mpattribute("pea_epinfirstsect") and mp.get_mpattribute("pea_isexe") and mp.get_mpattribute("pea_entrybyte60") and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
