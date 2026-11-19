-- Threat: !InfrastructureShared
-- Name: 9178307d6ece
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 102400 then
  return mp.INFECTED
end
return mp.CLEAN
