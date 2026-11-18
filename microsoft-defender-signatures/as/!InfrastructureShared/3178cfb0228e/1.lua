-- Threat: !InfrastructureShared
-- Name: 3178cfb0228e
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
