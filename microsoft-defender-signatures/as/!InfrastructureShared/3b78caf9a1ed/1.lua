-- Threat: !InfrastructureShared
-- Name: 3b78caf9a1ed
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
