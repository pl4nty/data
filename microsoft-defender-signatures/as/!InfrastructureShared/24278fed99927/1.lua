-- Threat: !InfrastructureShared
-- Name: 24278fed99927
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
