-- Threat: !InfrastructureShared
-- Name: 12878f542655d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
