-- Threat: !InfrastructureShared
-- Name: 4978fe14cb7e
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 20480000 then
  return mp.INFECTED
end
return mp.CLEAN
