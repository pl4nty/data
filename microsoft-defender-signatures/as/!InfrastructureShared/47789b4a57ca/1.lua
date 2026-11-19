-- Threat: !InfrastructureShared
-- Name: 47789b4a57ca
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
