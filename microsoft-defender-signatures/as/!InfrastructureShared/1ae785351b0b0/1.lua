-- Threat: !InfrastructureShared
-- Name: 1ae785351b0b0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
