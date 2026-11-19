-- Threat: !InfrastructureShared
-- Name: de6144161b40
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
