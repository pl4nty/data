-- Threat: !InfrastructureShared
-- Name: 9d782b5749b5
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
