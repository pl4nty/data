-- Threat: !InfrastructureShared
-- Name: 12778f896311f
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
