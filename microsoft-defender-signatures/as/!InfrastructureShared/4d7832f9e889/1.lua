-- Threat: !InfrastructureShared
-- Name: 4d7832f9e889
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
