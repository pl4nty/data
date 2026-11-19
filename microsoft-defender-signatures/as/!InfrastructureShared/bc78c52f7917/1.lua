-- Threat: !InfrastructureShared
-- Name: bc78c52f7917
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
