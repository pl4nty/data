-- Threat: !InfrastructureShared
-- Name: 32784edf522d
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
