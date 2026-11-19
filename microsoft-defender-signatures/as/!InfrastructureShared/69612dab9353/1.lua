-- Threat: !InfrastructureShared
-- Name: 69612dab9353
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
