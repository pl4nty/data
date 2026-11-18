-- Threat: !InfrastructureShared
-- Name: 44786db6ecf6
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 20480000 then
  return mp.INFECTED
end
return mp.CLEAN
