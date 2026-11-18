-- Threat: !InfrastructureShared
-- Name: 8b787ff72ef6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and mp.getfilesize() > 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
