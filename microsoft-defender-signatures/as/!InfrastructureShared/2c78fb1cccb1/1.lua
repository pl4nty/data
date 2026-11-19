-- Threat: !InfrastructureShared
-- Name: 2c78fb1cccb1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
