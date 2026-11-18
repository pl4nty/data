-- Threat: !InfrastructureShared
-- Name: 4e785a7cb189
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
