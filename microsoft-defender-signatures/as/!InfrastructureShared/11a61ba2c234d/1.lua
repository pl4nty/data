-- Threat: !InfrastructureShared
-- Name: 11a61ba2c234d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
