-- Threat: !InfrastructureShared
-- Name: 50788c3f58b0
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
