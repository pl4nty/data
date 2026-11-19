-- Threat: !InfrastructureShared
-- Name: 8f7816a73e1c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
