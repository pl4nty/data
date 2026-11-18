-- Threat: !InfrastructureShared
-- Name: 28540bae388df
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and mp.getfilesize() < 93185 then
  return mp.INFECTED
end
return mp.CLEAN
