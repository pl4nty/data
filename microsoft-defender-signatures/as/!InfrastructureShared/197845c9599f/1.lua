-- Threat: !InfrastructureShared
-- Name: 197845c9599f
-- Type: 21

if peattributes.has_msilresources and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
