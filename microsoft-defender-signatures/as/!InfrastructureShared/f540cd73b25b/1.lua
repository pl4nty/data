-- Threat: !InfrastructureShared
-- Name: f540cd73b25b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and mp.getfilesize() < 74241 then
  return mp.INFECTED
end
return mp.CLEAN
