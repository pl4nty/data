-- Threat: !InfrastructureShared
-- Name: 6a788d4397cd
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
