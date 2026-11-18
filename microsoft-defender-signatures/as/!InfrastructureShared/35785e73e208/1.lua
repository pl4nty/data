-- Threat: !InfrastructureShared
-- Name: 35785e73e208
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
