-- Threat: !InfrastructureShared
-- Name: 487882ce0a20
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
