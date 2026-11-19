-- Threat: !InfrastructureShared
-- Name: ce78f00af29e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
