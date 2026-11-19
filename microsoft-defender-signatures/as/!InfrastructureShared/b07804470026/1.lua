-- Threat: !InfrastructureShared
-- Name: b07804470026
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 102400 then
  return mp.INFECTED
end
return mp.CLEAN
