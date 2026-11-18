-- Threat: !InfrastructureShared
-- Name: 5178be6127c2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and mp.getfilesize() < 58368 then
  return mp.INFECTED
end
return mp.CLEAN
