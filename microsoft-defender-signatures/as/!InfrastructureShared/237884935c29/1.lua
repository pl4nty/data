-- Threat: !InfrastructureShared
-- Name: 237884935c29
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and mp.getfilesize() < 58368 then
  return mp.INFECTED
end
return mp.CLEAN
