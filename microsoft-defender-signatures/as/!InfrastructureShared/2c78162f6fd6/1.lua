-- Threat: !InfrastructureShared
-- Name: 2c78162f6fd6
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
