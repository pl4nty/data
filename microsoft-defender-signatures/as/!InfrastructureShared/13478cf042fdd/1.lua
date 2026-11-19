-- Threat: !InfrastructureShared
-- Name: 13478cf042fdd
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
