-- Threat: !InfrastructureShared
-- Name: 15540d12b827b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
