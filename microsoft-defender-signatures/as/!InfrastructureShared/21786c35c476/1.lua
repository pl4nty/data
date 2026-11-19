-- Threat: !InfrastructureShared
-- Name: 21786c35c476
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
