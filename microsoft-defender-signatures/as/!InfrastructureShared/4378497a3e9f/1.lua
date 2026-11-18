-- Threat: !InfrastructureShared
-- Name: 4378497a3e9f
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
