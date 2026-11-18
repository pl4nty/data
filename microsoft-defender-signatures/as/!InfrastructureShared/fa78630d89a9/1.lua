-- Threat: !InfrastructureShared
-- Name: fa78630d89a9
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
