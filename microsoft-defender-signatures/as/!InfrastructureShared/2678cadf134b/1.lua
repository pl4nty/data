-- Threat: !InfrastructureShared
-- Name: 2678cadf134b
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
