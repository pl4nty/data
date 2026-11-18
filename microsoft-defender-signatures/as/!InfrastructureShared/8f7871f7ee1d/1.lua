-- Threat: !InfrastructureShared
-- Name: 8f7871f7ee1d
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
