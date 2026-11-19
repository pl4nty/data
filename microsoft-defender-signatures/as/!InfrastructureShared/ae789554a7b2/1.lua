-- Threat: !InfrastructureShared
-- Name: ae789554a7b2
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 51200 then
  return mp.INFECTED
end
return mp.CLEAN
