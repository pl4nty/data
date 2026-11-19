-- Threat: !InfrastructureShared
-- Name: fd789c8ab4af
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 102400 then
  return mp.INFECTED
end
return mp.CLEAN
