-- Threat: !InfrastructureShared
-- Name: 2e789e0233cf
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("NID:Win32/Mortis.MA!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
