-- Threat: !InfrastructureShared
-- Name: 3e7848c3059d
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
