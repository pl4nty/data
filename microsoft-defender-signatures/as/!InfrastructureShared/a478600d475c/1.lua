-- Threat: !InfrastructureShared
-- Name: a478600d475c
-- Type: 21

if mp.getfilesize() < 8000 then
  return mp.INFECTED
end
return mp.CLEAN
