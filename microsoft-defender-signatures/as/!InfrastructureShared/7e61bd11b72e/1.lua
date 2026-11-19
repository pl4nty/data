-- Threat: !InfrastructureShared
-- Name: 7e61bd11b72e
-- Type: 21

if mp.getfilesize() >= 4194304 then
  return mp.CLEAN
end
return mp.INFECTED
