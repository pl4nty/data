-- Threat: !InfrastructureShared
-- Name: 7278f4e4e993
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
