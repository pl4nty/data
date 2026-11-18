-- Threat: !InfrastructureShared
-- Name: 4f78fe6caa19
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
