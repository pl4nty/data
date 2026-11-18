-- Threat: !InfrastructureShared
-- Name: 74789bc74fc8
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
