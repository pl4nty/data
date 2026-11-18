-- Threat: !InfrastructureShared
-- Name: 20d788587652a
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
