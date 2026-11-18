-- Threat: !InfrastructureShared
-- Name: 6078f8ab6515
-- Type: 21

if mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
