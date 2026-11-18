-- Threat: !InfrastructureShared
-- Name: 1e78911d2fc6
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
