-- Threat: !InfrastructureShared
-- Name: 4c78652f305e
-- Type: 21

if mp.getfilesize() >= 204800 and mp.getfilesize() <= 212992 then
  return mp.INFECTED
end
return mp.CLEAN
