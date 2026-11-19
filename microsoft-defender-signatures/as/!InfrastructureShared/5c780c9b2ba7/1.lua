-- Threat: !InfrastructureShared
-- Name: 5c780c9b2ba7
-- Type: 21

if mp.get_mpattribute("pea_isexe") and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
