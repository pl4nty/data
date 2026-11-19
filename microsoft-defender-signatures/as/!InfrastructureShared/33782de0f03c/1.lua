-- Threat: !InfrastructureShared
-- Name: 33782de0f03c
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
