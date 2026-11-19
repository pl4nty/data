-- Threat: !InfrastructureShared
-- Name: b540b6bd2221
-- Type: 21

if mp.getfilesize() < 1536000 then
  return mp.INFECTED
end
return mp.CLEAN
