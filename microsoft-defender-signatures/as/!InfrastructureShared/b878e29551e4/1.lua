-- Threat: !InfrastructureShared
-- Name: b878e29551e4
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
