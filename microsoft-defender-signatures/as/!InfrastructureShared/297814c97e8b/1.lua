-- Threat: !InfrastructureShared
-- Name: 297814c97e8b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
