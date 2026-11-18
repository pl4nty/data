-- Threat: !InfrastructureShared
-- Name: 82789cb7e609
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
