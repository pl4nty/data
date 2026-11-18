-- Threat: !InfrastructureShared
-- Name: 107785dc2287a
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 102400 then
  return mp.INFECTED
end
return mp.CLEAN
