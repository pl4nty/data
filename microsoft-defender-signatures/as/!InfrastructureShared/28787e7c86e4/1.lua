-- Threat: !InfrastructureShared
-- Name: 28787e7c86e4
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
