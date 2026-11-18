-- Threat: !InfrastructureShared
-- Name: 4d782bec6b6c
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() > 478700000 then
  return mp.INFECTED
end
return mp.CLEAN
