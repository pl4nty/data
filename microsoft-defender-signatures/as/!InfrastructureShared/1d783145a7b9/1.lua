-- Threat: !InfrastructureShared
-- Name: 1d783145a7b9
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
