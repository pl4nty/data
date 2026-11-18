-- Threat: !InfrastructureShared
-- Name: 597865266f21
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
