-- Threat: !InfrastructureShared
-- Name: 95781a067ee0
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 400000 then
  return mp.INFECTED
end
return mp.CLEAN
