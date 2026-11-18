-- Threat: !InfrastructureShared
-- Name: f478f0760acf
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
