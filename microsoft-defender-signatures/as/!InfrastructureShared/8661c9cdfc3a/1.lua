-- Threat: !InfrastructureShared
-- Name: 8661c9cdfc3a
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
