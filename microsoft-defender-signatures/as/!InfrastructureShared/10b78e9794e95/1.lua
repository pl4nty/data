-- Threat: !InfrastructureShared
-- Name: 10b78e9794e95
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
