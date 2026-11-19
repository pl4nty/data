-- Threat: !InfrastructureShared
-- Name: 9b7879dfb45a
-- Type: 21
-- Flags: 1

if mp.getfilesize() > 30000 and mp.getfilesize() < 200000 then
  return mp.INFECTED
end
return mp.CLEAN
