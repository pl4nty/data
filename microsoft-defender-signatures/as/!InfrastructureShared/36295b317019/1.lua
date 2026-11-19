-- Threat: !InfrastructureShared
-- Name: 36295b317019
-- Type: 21

if string.match(string.lower(mp.getfilename()), "%.php$") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
