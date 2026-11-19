-- Threat: !InfrastructureShared
-- Name: 282965b465d9
-- Type: 21

if string.match(string.lower(mp.getfilename()), "%.c$") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
