-- Threat: !InfrastructureShared
-- Name: ba78e1055184
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
