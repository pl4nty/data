-- Threat: !InfrastructureShared
-- Name: 79617528342a
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
