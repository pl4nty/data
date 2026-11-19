-- Threat: !InfrastructureShared
-- Name: 267839e587f8
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
