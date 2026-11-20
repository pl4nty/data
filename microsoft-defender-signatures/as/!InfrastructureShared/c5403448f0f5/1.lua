-- Threat: !InfrastructureShared
-- Name: c5403448f0f5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
