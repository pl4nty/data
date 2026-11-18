-- Threat: !InfrastructureShared
-- Name: d37892e6e3e2
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
