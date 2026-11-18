-- Threat: !InfrastructureShared
-- Name: 4d78680e6cae
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
