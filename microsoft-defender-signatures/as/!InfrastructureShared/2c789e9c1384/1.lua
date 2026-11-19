-- Threat: !InfrastructureShared
-- Name: 2c789e9c1384
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
