-- Threat: !InfrastructureShared
-- Name: 9f782885519b
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 200000 then
  return mp.INFECTED
end
return mp.CLEAN
