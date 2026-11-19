-- Threat: !InfrastructureShared
-- Name: 3f789c8195a7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
