-- Threat: !InfrastructureShared
-- Name: 2178edb90e0b
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
