-- Threat: !InfrastructureShared
-- Name: 2d78d4b5a4da
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
