-- Threat: !InfrastructureShared
-- Name: 81780b361209
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
