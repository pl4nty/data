-- Threat: !InfrastructureShared
-- Name: 115401faf19e1
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
