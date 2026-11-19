-- Threat: !InfrastructureShared
-- Name: 5d29ef4c73ac
-- Type: 21

if mp.getfilesize() <= 256 then
  return mp.INFECTED
end
return mp.CLEAN
