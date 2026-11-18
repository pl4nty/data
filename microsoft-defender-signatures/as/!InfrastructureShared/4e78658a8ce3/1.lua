-- Threat: !InfrastructureShared
-- Name: 4e78658a8ce3
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
