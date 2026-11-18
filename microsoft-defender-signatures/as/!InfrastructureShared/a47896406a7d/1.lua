-- Threat: !InfrastructureShared
-- Name: a47896406a7d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
