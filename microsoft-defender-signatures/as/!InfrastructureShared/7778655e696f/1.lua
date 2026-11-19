-- Threat: !InfrastructureShared
-- Name: 7778655e696f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
