-- Threat: !InfrastructureShared
-- Name: 257823c43204
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
