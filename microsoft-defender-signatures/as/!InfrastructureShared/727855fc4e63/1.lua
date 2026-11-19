-- Threat: !InfrastructureShared
-- Name: 727855fc4e63
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
