-- Threat: !InfrastructureShared
-- Name: 654024911fcc
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
