-- Threat: !InfrastructureShared
-- Name: 1a540943c9a36
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and mp.getfilesize() < 92673 then
  return mp.INFECTED
end
return mp.CLEAN
