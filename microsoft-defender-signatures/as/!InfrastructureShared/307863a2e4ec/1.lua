-- Threat: !InfrastructureShared
-- Name: 307863a2e4ec
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
