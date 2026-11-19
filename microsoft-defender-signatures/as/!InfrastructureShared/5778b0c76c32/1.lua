-- Threat: !InfrastructureShared
-- Name: 5778b0c76c32
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
