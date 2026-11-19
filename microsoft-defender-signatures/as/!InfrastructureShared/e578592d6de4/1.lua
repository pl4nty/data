-- Threat: !InfrastructureShared
-- Name: e578592d6de4
-- Type: 21

if mp.get_mpattribute("pea_isexe") and peattributes.no_security == true and mp.getfilesize() < 120000 then
  return mp.INFECTED
end
return mp.CLEAN
