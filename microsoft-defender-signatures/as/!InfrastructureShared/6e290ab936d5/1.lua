-- Threat: !InfrastructureShared
-- Name: 6e290ab936d5
-- Type: 21

if mp.get_mpattribute("//RPF:IS_Lnk") then
  return mp.INFECTED
end
return mp.CLEAN
