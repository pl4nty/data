-- Threat: !InfrastructureShared
-- Name: a4783a54cd54
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
