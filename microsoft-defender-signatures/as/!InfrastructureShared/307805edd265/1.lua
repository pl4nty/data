-- Threat: !InfrastructureShared
-- Name: 307805edd265
-- Type: 21

if peattributes.has_msilresources and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
