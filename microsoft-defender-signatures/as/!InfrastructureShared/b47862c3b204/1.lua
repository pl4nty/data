-- Threat: !InfrastructureShared
-- Name: b47862c3b204
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 40000 then
  return mp.INFECTED
end
return mp.CLEAN
