-- Threat: !InfrastructureShared
-- Name: 5b7873f00a1b
-- Type: 21

if peattributes.no_security == true and peattributes.isexe and mp.getfilesize() > 2470000 and mp.getfilesize() < 2800000 then
  return mp.INFECTED
end
return mp.CLEAN
