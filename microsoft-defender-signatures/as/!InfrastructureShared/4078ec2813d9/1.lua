-- Threat: !InfrastructureShared
-- Name: 4078ec2813d9
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
