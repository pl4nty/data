-- Threat: !InfrastructureShared
-- Name: 10540d594af08
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
