-- Threat: !InfrastructureShared
-- Name: fd781efea876
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() > 314000000 then
  return mp.INFECTED
end
return mp.CLEAN
