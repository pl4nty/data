-- Threat: !InfrastructureShared
-- Name: 60780d74bb04
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
