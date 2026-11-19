-- Threat: !InfrastructureShared
-- Name: 3578c4f3087b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
