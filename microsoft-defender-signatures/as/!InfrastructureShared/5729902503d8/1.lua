-- Threat: !InfrastructureShared
-- Name: 5729902503d8
-- Type: 21

if mp.get_mpattribute("//RPF:IS_Lnk") then
  return mp.INFECTED
end
return mp.CLEAN
