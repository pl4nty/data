-- Threat: !InfrastructureShared
-- Name: b540637e3af8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
