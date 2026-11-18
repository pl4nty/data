-- Threat: !InfrastructureShared
-- Name: 9d78e3e9ea7e
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
