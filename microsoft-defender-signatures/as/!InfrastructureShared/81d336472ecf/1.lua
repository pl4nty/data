-- Threat: !InfrastructureShared
-- Name: 81d336472ecf
-- Type: 21

if mp.getfilesize() < 850000 then
  return mp.INFECTED
end
return mp.CLEAN
