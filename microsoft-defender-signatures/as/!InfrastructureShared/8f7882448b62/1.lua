-- Threat: !InfrastructureShared
-- Name: 8f7882448b62
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
