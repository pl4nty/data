-- Threat: !InfrastructureShared
-- Name: 9978836f30ea
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
