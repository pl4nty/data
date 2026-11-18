-- Threat: !InfrastructureShared
-- Name: c54058a18a1f
-- Type: 21

if peattributes.isdll and not peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
