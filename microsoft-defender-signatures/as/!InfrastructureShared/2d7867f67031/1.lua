-- Threat: !InfrastructureShared
-- Name: 2d7867f67031
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
