-- Threat: !InfrastructureShared
-- Name: 6378ec19e8af
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
