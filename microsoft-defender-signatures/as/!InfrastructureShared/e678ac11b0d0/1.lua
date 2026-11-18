-- Threat: !InfrastructureShared
-- Name: e678ac11b0d0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
