-- Threat: !InfrastructureShared
-- Name: 4b7812b59ed2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and mp.getfilesize() < 20000 then
  return mp.INFECTED
end
return mp.CLEAN
