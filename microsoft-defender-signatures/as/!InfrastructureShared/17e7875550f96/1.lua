-- Threat: !InfrastructureShared
-- Name: 17e7875550f96
-- Type: 21

if peattributes.ismsil and mp.getfilesize() < 20480 then
  return mp.INFECTED
end
return mp.LOWFI
