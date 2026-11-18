-- Threat: !InfrastructureShared
-- Name: ad786f5bf77d
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
