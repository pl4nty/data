-- Threat: !InfrastructureShared
-- Name: ad781d56208b
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 102400 then
  return mp.INFECTED
end
return mp.CLEAN
