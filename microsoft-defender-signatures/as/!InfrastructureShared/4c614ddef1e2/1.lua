-- Threat: !InfrastructureShared
-- Name: 4c614ddef1e2
-- Type: 21

if mp.get_mpattribute("pea_isdll") and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
