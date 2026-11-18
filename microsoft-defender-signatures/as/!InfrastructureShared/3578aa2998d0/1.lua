-- Threat: !InfrastructureShared
-- Name: 3578aa2998d0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
