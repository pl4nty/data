-- Threat: !InfrastructureShared
-- Name: 25785f9996fe
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
