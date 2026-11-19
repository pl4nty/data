-- Threat: !InfrastructureShared
-- Name: 26781d943a3d
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
