-- Threat: !InfrastructureShared
-- Name: e3785e8fa00e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
