-- Threat: !InfrastructureShared
-- Name: 1a5785e16a3bb
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
