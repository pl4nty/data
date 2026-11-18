-- Threat: !InfrastructureShared
-- Name: 5878c3f5bed3
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
