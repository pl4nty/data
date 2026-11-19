-- Threat: !InfrastructureShared
-- Name: 6378df088a42
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
