-- Threat: !InfrastructureShared
-- Name: 38789d4a1b63
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
