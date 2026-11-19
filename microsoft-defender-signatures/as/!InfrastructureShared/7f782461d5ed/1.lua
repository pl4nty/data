-- Threat: !InfrastructureShared
-- Name: 7f782461d5ed
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
