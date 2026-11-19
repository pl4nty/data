-- Threat: !InfrastructureShared
-- Name: a078e2ea8bb8
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
