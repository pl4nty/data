-- Threat: !InfrastructureShared
-- Name: 217806449a9c
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
