-- Threat: !InfrastructureShared
-- Name: 2f7889afb037
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
