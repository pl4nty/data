-- Threat: !InfrastructureShared
-- Name: 135781fe07c8f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
