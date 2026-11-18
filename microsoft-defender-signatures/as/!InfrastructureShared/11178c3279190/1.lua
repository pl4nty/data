-- Threat: !InfrastructureShared
-- Name: 11178c3279190
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
