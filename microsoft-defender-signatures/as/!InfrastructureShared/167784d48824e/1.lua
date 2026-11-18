-- Threat: !InfrastructureShared
-- Name: 167784d48824e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
