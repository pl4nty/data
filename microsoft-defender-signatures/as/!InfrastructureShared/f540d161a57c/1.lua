-- Threat: !InfrastructureShared
-- Name: f540d161a57c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
