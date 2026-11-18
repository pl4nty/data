-- Threat: !InfrastructureShared
-- Name: 2078022c649f
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
