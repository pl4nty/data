-- Threat: !InfrastructureShared
-- Name: 80786b3f423a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
