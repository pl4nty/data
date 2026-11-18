-- Threat: !InfrastructureShared
-- Name: e27890b93d27
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
