-- Threat: !InfrastructureShared
-- Name: 407807f5b69f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
