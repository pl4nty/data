-- Threat: !InfrastructureShared
-- Name: 97787db319f2
-- Type: 21

if peattributes.ismsil and mp.getfilesize() < 102400 then
  return mp.INFECTED
end
return mp.CLEAN
