-- Threat: !InfrastructureShared
-- Name: 70788c49d02d
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
