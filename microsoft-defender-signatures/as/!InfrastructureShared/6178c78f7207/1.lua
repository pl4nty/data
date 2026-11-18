-- Threat: !InfrastructureShared
-- Name: 6178c78f7207
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 20480000 then
  return mp.INFECTED
end
return mp.CLEAN
