-- Threat: !InfrastructureShared
-- Name: 987843556878
-- Type: 21

if peattributes.hasexports == true and peattributes.isdll == false then
  return mp.INFECTED
end
return mp.CLEAN
