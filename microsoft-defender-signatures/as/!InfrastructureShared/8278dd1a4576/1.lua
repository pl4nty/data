-- Threat: !InfrastructureShared
-- Name: 8278dd1a4576
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
