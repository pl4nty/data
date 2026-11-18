-- Threat: !InfrastructureShared
-- Name: 3d780c9f1933
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
