-- Threat: !InfrastructureShared
-- Name: a778e9ea35c9
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
