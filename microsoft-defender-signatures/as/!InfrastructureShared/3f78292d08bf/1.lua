-- Threat: !InfrastructureShared
-- Name: 3f78292d08bf
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
