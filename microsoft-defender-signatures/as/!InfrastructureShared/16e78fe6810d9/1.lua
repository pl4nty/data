-- Threat: !InfrastructureShared
-- Name: 16e78fe6810d9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
