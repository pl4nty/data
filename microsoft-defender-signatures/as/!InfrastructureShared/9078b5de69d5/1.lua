-- Threat: !InfrastructureShared
-- Name: 9078b5de69d5
-- Type: 21

if mp.getfilesize() < 30000 then
  return mp.INFECTED
end
return mp.CLEAN
