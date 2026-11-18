-- Threat: !InfrastructureShared
-- Name: 6761e0eddf86
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
