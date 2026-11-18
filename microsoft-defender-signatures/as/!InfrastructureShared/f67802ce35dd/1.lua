-- Threat: !InfrastructureShared
-- Name: f67802ce35dd
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
