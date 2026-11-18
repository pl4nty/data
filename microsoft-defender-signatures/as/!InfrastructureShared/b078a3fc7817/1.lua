-- Threat: !InfrastructureShared
-- Name: b078a3fc7817
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 350000 then
  return mp.INFECTED
end
return mp.CLEAN
