-- Threat: !InfrastructureShared
-- Name: 6b78378432d0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
