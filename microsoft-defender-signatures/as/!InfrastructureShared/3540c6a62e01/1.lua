-- Threat: !InfrastructureShared
-- Name: 3540c6a62e01
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("\\windows\\adfs\\", 1, true) or l_0_0:find("\\windows\\microsoft.net\\assembly\\gac_msil\\microsoft.identityserver", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
