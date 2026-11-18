-- Threat: !InfrastructureShared
-- Name: cc780898882a
-- Type: 21

if peattributes.ismsil ~= true then
  return mp.CLEAN
end
return mp.INFECTED
