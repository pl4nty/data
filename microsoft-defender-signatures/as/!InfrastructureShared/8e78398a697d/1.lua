-- Threat: !InfrastructureShared
-- Name: 8e78398a697d
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 102400 then
  return mp.INFECTED
end
return mp.CLEAN
