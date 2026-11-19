-- Threat: !InfrastructureShared
-- Name: 8e617a62f827
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
