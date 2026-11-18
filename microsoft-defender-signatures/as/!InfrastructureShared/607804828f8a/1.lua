-- Threat: !InfrastructureShared
-- Name: 607804828f8a
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
