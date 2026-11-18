-- Threat: !InfrastructureShared
-- Name: 64783ff83220
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
