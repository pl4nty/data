-- Threat: !InfrastructureShared
-- Name: 125403a6167a8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and mp.getfilesize() < 2500000 then
  return mp.INFECTED
end
return mp.CLEAN
