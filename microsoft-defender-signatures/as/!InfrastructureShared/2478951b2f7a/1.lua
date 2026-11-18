-- Threat: !InfrastructureShared
-- Name: 2478951b2f7a
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
