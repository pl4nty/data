-- Threat: !InfrastructureShared
-- Name: 64780c6f66fd
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
