-- Threat: !InfrastructureShared
-- Name: 4178f26d1a57
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
