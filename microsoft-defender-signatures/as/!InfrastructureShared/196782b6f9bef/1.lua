-- Threat: !InfrastructureShared
-- Name: 196782b6f9bef
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
