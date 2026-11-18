-- Threat: !InfrastructureShared
-- Name: ef7840c44038
-- Type: 21

if mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
