-- Threat: !InfrastructureShared
-- Name: 1717881a1a4b4
-- Type: 21

if mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
