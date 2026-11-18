-- Threat: !InfrastructureShared
-- Name: a27856459291
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
