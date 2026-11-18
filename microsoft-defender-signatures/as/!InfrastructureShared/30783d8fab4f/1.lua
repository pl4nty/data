-- Threat: !InfrastructureShared
-- Name: 30783d8fab4f
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
