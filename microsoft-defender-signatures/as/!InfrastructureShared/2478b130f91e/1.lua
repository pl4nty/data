-- Threat: !InfrastructureShared
-- Name: 2478b130f91e
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
