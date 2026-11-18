-- Threat: !InfrastructureShared
-- Name: 14e780a812064
-- Type: 21

if peattributes.ismsil and mp.getfilesize() <= 65536 then
  return mp.INFECTED
end
return mp.CLEAN
