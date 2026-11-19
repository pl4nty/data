-- Threat: !InfrastructureShared
-- Name: 4778ddebb581
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
