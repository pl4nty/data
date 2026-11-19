-- Threat: !InfrastructureShared
-- Name: 18478cd39f380
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 102400 then
  return mp.INFECTED
end
return mp.CLEAN
