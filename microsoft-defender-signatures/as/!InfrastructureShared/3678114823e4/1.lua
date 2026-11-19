-- Threat: !InfrastructureShared
-- Name: 3678114823e4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
