-- Threat: !InfrastructureShared
-- Name: 822927085543
-- Type: 21

if string.match(string.lower(mp.getfilename()), "%.c$") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
