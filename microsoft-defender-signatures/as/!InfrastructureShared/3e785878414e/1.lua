-- Threat: !InfrastructureShared
-- Name: 3e785878414e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
