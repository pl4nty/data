-- Threat: !InfrastructureShared
-- Name: 5278779b156b
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
