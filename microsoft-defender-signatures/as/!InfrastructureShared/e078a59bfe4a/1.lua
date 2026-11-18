-- Threat: !InfrastructureShared
-- Name: e078a59bfe4a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
