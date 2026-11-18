-- Threat: !InfrastructureShared
-- Name: 12e785d50300c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
