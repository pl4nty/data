-- Threat: !InfrastructureShared
-- Name: 7f7812880f25
-- Type: 21
-- Flags: 1

if mp.getfilesize() < 40000 then
  return mp.INFECTED
end
return mp.CLEAN
