-- Threat: !InfrastructureShared
-- Name: 57784b684754
-- Type: 21

if mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
