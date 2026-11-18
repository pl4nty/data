-- Threat: !InfrastructureShared
-- Name: 37619216d3ff
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
