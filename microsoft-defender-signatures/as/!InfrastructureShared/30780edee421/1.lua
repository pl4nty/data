-- Threat: !InfrastructureShared
-- Name: 30780edee421
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
