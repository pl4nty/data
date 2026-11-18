-- Threat: !InfrastructureShared
-- Name: 387805de31fb
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 20480000 then
  return mp.INFECTED
end
return mp.CLEAN
