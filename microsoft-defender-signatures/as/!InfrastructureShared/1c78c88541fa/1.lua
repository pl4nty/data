-- Threat: !InfrastructureShared
-- Name: 1c78c88541fa
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
