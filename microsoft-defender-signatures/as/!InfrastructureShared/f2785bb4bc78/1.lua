-- Threat: !InfrastructureShared
-- Name: f2785bb4bc78
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
