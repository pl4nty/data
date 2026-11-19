-- Threat: !InfrastructureShared
-- Name: 64782d5ee742
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
