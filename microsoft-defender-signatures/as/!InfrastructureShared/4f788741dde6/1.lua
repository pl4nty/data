-- Threat: !InfrastructureShared
-- Name: 4f788741dde6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
