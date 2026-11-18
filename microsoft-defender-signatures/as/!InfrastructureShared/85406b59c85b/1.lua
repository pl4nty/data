-- Threat: !InfrastructureShared
-- Name: 85406b59c85b
-- Type: 21

if peattributes.isdll and not peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
