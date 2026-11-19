-- Threat: !InfrastructureShared
-- Name: 74789cc489ef
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
