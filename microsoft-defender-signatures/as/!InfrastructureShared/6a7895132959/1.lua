-- Threat: !InfrastructureShared
-- Name: 6a7895132959
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
