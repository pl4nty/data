-- Threat: !InfrastructureShared
-- Name: fd78b59a69c6
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() > 314000000 then
  return mp.INFECTED
end
return mp.CLEAN
