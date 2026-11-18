-- Threat: !InfrastructureShared
-- Name: 3f786d9c2d4b
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
