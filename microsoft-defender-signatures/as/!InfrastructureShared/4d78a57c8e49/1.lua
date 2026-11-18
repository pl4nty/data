-- Threat: !InfrastructureShared
-- Name: 4d78a57c8e49
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
