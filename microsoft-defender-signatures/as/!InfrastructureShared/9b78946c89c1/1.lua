-- Threat: !InfrastructureShared
-- Name: 9b78946c89c1
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
