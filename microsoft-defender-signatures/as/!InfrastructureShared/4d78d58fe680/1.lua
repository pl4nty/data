-- Threat: !InfrastructureShared
-- Name: 4d78d58fe680
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
