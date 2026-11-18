-- Threat: !InfrastructureShared
-- Name: 1517834695fbb
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
