-- Threat: !InfrastructureShared
-- Name: cd780ebd7e39
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
