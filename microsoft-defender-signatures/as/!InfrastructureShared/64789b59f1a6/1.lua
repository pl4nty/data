-- Threat: !InfrastructureShared
-- Name: 64789b59f1a6
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2500000 then
  return mp.INFECTED
end
return mp.CLEAN
