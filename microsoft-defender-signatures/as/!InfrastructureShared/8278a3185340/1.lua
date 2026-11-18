-- Threat: !InfrastructureShared
-- Name: 8278a3185340
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
