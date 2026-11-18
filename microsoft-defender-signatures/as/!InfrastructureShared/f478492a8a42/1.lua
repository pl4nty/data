-- Threat: !InfrastructureShared
-- Name: f478492a8a42
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
