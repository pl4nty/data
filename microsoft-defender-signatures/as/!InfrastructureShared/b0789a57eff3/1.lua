-- Threat: !InfrastructureShared
-- Name: b0789a57eff3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
