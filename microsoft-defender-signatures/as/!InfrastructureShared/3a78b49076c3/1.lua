-- Threat: !InfrastructureShared
-- Name: 3a78b49076c3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
