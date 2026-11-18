-- Threat: !InfrastructureShared
-- Name: 10540b984a736
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
