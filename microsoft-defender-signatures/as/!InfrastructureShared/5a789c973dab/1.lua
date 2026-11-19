-- Threat: !InfrastructureShared
-- Name: 5a789c973dab
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
