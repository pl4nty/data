-- Threat: !InfrastructureShared
-- Name: d678195489ed
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 102400 then
  return mp.INFECTED
end
return mp.CLEAN
