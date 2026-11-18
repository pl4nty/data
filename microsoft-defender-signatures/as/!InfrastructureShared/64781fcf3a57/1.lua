-- Threat: !InfrastructureShared
-- Name: 64781fcf3a57
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
