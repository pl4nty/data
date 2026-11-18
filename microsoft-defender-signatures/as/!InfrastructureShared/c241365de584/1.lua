-- Threat: !InfrastructureShared
-- Name: c241365de584
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() < 10240 then
  return mp.INFECTED
end
return mp.CLEAN
