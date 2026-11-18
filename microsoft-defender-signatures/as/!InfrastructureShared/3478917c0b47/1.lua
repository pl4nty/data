-- Threat: !InfrastructureShared
-- Name: 3478917c0b47
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
