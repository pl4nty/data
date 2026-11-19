-- Threat: !InfrastructureShared
-- Name: 9978f68316f2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
