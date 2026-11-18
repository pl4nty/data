-- Threat: !InfrastructureShared
-- Name: d47896a34063
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 12000 then
  return mp.INFECTED
end
return mp.CLEAN
