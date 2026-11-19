-- Threat: !InfrastructureShared
-- Name: 267863678588
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
