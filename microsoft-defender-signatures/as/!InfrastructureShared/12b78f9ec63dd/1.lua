-- Threat: !InfrastructureShared
-- Name: 12b78f9ec63dd
-- Type: 21

if mp.getfilesize() < 199680 then
  return mp.INFECTED
end
return mp.CLEAN
