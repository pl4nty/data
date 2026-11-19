-- Threat: !InfrastructureShared
-- Name: 2978804383c1
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
