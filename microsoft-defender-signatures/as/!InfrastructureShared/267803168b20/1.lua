-- Threat: !InfrastructureShared
-- Name: 267803168b20
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
