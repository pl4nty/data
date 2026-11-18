-- Threat: !InfrastructureShared
-- Name: 4c783650c56e
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
