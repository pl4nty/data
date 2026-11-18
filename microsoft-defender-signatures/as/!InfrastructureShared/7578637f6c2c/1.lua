-- Threat: !InfrastructureShared
-- Name: 7578637f6c2c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
