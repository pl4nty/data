-- Threat: !InfrastructureShared
-- Name: 69781903fcdc
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
