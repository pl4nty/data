-- Threat: !InfrastructureShared
-- Name: 3b781e0b1ed4
-- Type: 21

if peattributes.ismsil == false then
  return mp.CLEAN
end
if peattributes.isdll == false then
  return mp.CLEAN
end
if mp.getfilesize() > 102400 then
  return mp.CLEAN
end
return mp.INFECTED
