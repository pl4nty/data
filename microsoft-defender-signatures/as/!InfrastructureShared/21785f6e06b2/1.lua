-- Threat: !InfrastructureShared
-- Name: 21785f6e06b2
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
