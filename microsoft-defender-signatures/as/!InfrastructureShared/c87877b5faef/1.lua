-- Threat: !InfrastructureShared
-- Name: c87877b5faef
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
