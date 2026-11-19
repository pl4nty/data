-- Threat: !InfrastructureShared
-- Name: 10d789055340a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
