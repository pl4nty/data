-- Threat: !InfrastructureShared
-- Name: 1ee78d24e7633
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
