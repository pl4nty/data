-- Threat: !InfrastructureShared
-- Name: 27b784f6ba81c
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 102400 then
  return mp.INFECTED
end
return mp.CLEAN
