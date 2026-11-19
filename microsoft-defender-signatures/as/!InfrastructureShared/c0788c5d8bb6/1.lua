-- Threat: !InfrastructureShared
-- Name: c0788c5d8bb6
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 102400 then
  return mp.INFECTED
end
return mp.CLEAN
