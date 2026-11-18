-- Threat: !InfrastructureShared
-- Name: 2261a21e552c
-- Type: 21

if peattributes.isdll and not peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
