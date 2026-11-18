-- Threat: !InfrastructureShared
-- Name: 4578f25e2a1d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
