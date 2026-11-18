-- Threat: !InfrastructureShared
-- Name: 2678e0f378b7
-- Type: 21

if peattributes.ismsil and peattributes.isexe and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
