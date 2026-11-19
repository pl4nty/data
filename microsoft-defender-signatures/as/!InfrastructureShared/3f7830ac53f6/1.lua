-- Threat: !InfrastructureShared
-- Name: 3f7830ac53f6
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
