-- Threat: !InfrastructureShared
-- Name: 3d7878f5a198
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
