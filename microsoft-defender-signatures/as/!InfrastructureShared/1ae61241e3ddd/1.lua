-- Threat: !InfrastructureShared
-- Name: 1ae61241e3ddd
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
