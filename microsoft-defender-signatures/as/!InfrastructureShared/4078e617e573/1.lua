-- Threat: !InfrastructureShared
-- Name: 4078e617e573
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
