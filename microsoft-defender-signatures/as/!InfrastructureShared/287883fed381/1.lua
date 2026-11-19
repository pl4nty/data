-- Threat: !InfrastructureShared
-- Name: 287883fed381
-- Type: 21

if mp.getfilesize() < 307200 then
  return mp.INFECTED
end
return mp.CLEAN
