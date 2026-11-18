-- Threat: !InfrastructureShared
-- Name: 4178fd65beab
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
