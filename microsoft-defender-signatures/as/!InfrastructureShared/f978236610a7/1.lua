-- Threat: !InfrastructureShared
-- Name: f978236610a7
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
