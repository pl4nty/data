-- Threat: !InfrastructureShared
-- Name: b0787c8d0a4e
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() == 36864 then
  return mp.INFECTED
end
return mp.CLEAN
