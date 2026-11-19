-- Threat: !InfrastructureShared
-- Name: 56787a64c6b0
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
