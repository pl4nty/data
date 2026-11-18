-- Threat: !InfrastructureShared
-- Name: 7478959658e4
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
