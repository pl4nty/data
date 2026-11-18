-- Threat: !InfrastructureShared
-- Name: 17c78d5735bca
-- Type: 21

if mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
