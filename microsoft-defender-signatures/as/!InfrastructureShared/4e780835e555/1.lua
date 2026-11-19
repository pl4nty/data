-- Threat: !InfrastructureShared
-- Name: 4e780835e555
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
