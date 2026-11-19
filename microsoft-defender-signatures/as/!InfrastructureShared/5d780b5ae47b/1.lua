-- Threat: !InfrastructureShared
-- Name: 5d780b5ae47b
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
