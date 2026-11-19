-- Threat: !InfrastructureShared
-- Name: a178044d65ab
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
