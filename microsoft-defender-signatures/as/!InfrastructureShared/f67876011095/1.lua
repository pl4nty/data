-- Threat: !InfrastructureShared
-- Name: f67876011095
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
