-- Threat: !InfrastructureShared
-- Name: 55787fa2b1ad
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
