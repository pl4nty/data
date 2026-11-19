-- Threat: !InfrastructureShared
-- Name: b5403503fac7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
