-- Threat: !InfrastructureShared
-- Name: 4578b53e481c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
