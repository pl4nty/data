-- Threat: !InfrastructureShared
-- Name: 17a78d22f7dee
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
