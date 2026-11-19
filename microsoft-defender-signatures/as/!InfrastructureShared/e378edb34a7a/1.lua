-- Threat: !InfrastructureShared
-- Name: e378edb34a7a
-- Type: 21

if mp.getfilesize() < 520000 then
  return mp.INFECTED
end
return mp.CLEAN
