-- Threat: !InfrastructureShared
-- Name: 2ebffefd3ef6
-- Type: 21

if mp.getfilesize() < 511 then
  return mp.INFECTED
end
return mp.CLEAN
