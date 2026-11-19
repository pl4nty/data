-- Threat: !InfrastructureShared
-- Name: 39788fd78ef7
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
