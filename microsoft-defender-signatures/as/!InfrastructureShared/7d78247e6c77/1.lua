-- Threat: !InfrastructureShared
-- Name: 7d78247e6c77
-- Type: 21

if peattributes.isexe and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
