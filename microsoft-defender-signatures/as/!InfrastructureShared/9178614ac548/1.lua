-- Threat: !InfrastructureShared
-- Name: 9178614ac548
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
