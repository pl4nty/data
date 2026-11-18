-- Threat: !InfrastructureShared
-- Name: 1f787b03828e
-- Type: 21

if peattributes.isexe and peattributes.ismsil == false then
  return mp.INFECTED
end
return mp.CLEAN
