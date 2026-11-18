-- Threat: !InfrastructureShared
-- Name: 27d78dd17aa12
-- Type: 21

if mp.getfilesize() < 2048000 and pesecs[5].Name == "" then
  return mp.INFECTED
end
return mp.CLEAN
