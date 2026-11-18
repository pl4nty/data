-- Threat: !InfrastructureShared
-- Name: 30c781b80405c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
