-- Threat: !InfrastructureShared
-- Name: 4c7801932a43
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
