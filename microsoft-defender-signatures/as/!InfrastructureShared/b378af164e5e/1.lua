-- Threat: !InfrastructureShared
-- Name: b378af164e5e
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 51200 then
  return mp.INFECTED
end
return mp.CLEAN
