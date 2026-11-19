-- Threat: !InfrastructureShared
-- Name: 61784476a7fd
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
