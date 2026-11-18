-- Threat: !InfrastructureShared
-- Name: 7929b4f416dc
-- Type: 21

if mp.get_mpattribute("//RPF:IS_Lnk") then
  return mp.INFECTED
end
return mp.CLEAN
