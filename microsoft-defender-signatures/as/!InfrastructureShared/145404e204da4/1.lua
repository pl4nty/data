-- Threat: !InfrastructureShared
-- Name: 145404e204da4
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
