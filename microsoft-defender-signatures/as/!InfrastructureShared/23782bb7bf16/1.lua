-- Threat: !InfrastructureShared
-- Name: 23782bb7bf16
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
