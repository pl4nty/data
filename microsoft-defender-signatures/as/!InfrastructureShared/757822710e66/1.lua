-- Threat: !InfrastructureShared
-- Name: 757822710e66
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
