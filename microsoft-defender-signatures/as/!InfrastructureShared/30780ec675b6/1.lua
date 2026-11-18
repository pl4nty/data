-- Threat: !InfrastructureShared
-- Name: 30780ec675b6
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
