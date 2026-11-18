-- Threat: !InfrastructureShared
-- Name: b4788e907693
-- Type: 21

if mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
