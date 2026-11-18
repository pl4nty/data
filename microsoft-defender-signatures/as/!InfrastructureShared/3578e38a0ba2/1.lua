-- Threat: !InfrastructureShared
-- Name: 3578e38a0ba2
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
