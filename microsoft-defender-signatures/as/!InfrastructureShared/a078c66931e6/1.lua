-- Threat: !InfrastructureShared
-- Name: a078c66931e6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
