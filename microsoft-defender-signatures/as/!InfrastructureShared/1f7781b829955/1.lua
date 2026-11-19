-- Threat: !InfrastructureShared
-- Name: 1f7781b829955
-- Type: 21

if mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
