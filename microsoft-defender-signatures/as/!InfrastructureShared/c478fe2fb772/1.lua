-- Threat: !InfrastructureShared
-- Name: c478fe2fb772
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
