-- Threat: !InfrastructureShared
-- Name: 97786592e854
-- Type: 21

if mp.getfilesize() < 2424832 then
  return mp.INFECTED
end
return mp.CLEAN
