-- Threat: !InfrastructureShared
-- Name: 3e78794f50c7
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
