-- Threat: !InfrastructureShared
-- Name: 6978d5847512
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
