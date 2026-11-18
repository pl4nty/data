-- Threat: !InfrastructureShared
-- Name: 2e78544d6d65
-- Type: 21

if mp.getfilesize() <= 703915 and mp.getfilesize() >= 660992 then
  return mp.INFECTED
end
return mp.CLEAN
