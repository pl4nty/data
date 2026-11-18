-- Threat: !InfrastructureShared
-- Name: 7a7836ccb124
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
