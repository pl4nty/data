-- Threat: !InfrastructureShared
-- Name: 134781b599649
-- Type: 21

if mp.get_mpattribute("BM_MZ_DLL") and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
