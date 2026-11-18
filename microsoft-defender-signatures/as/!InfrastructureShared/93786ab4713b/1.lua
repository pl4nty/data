-- Threat: !InfrastructureShared
-- Name: 93786ab4713b
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
