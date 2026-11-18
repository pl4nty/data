-- Threat: !InfrastructureShared
-- Name: 69783fd3c071
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
