-- Threat: !InfrastructureShared
-- Name: 114785899acc4
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
