-- Threat: !InfrastructureShared
-- Name: cc78ca29d88b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
