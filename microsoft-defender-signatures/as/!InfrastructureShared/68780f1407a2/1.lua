-- Threat: !InfrastructureShared
-- Name: 68780f1407a2
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
