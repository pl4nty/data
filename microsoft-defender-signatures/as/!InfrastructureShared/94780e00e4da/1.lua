-- Threat: !InfrastructureShared
-- Name: 94780e00e4da
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
