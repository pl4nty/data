-- Threat: !InfrastructureShared
-- Name: 13178f9fbcf52
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
