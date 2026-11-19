-- Threat: !InfrastructureShared
-- Name: a678d8549951
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
