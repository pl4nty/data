-- Threat: !InfrastructureShared
-- Name: 4e788318a166
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and mp.getfilesize() < 8000 then
  return mp.INFECTED
end
return mp.CLEAN
