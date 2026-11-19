-- Threat: !InfrastructureShared
-- Name: 3b29913b93b5
-- Type: 21

if string.match(string.lower(mp.getfilename()), "%.xz$") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
