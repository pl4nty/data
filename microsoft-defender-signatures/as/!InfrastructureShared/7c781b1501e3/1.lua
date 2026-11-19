-- Threat: !InfrastructureShared
-- Name: 7c781b1501e3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
