-- Threat: !InfrastructureShared
-- Name: c578ea52ef1a
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 102400 then
  return mp.INFECTED
end
return mp.CLEAN
