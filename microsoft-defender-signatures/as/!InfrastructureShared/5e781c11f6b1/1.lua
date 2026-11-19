-- Threat: !InfrastructureShared
-- Name: 5e781c11f6b1
-- Type: 21

if mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
