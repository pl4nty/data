-- Threat: !InfrastructureShared
-- Name: bc7852d74039
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
