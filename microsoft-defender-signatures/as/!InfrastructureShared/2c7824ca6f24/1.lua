-- Threat: !InfrastructureShared
-- Name: 2c7824ca6f24
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
