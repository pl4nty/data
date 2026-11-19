-- Threat: !InfrastructureShared
-- Name: 7a78214a74ac
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
