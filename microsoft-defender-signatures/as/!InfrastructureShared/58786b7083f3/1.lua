-- Threat: !InfrastructureShared
-- Name: 58786b7083f3
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
