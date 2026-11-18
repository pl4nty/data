-- Threat: !InfrastructureShared
-- Name: a57885c3a320
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
