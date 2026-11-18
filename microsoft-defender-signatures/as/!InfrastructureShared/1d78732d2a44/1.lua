-- Threat: !InfrastructureShared
-- Name: 1d78732d2a44
-- Type: 21

if mp.get_mpattribute("pea_no_relocs") and mp.get_mpattribute("pea_lastscn_executable") and mp.get_mpattribute("pea_lastscn_writable") and mp.get_mpattribute("pea_firstsectwritable") and mp.get_mpattribute("pea_epoutofimage") then
  return mp.INFECTED
end
return mp.CLEAN
