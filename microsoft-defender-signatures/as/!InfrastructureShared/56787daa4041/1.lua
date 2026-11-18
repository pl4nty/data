-- Threat: !InfrastructureShared
-- Name: 56787daa4041
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
