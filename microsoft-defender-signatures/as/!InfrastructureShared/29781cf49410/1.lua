-- Threat: !InfrastructureShared
-- Name: 29781cf49410
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
