-- Threat: !InfrastructureShared
-- Name: 3d78a43c169c
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
