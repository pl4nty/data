-- Threat: !InfrastructureShared
-- Name: b44183c5652e
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 10000 then
  return mp.INFECTED
end
return mp.CLEAN
