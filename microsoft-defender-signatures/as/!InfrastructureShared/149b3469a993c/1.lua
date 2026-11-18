-- Threat: !InfrastructureShared
-- Name: 149b3469a993c
-- Type: 21
-- Includes: BMLuaLib

if IsADConnectRole() then
  return mp.CLEAN
end
if bm.GetSignatureMatchDuration() > 100000000 then
  return mp.CLEAN
end
if versioning.GetEngineBuild() >= 16700 then
  local l_0_0 = versioning.GetOrgID()
  if l_0_0 then
    bm.add_related_string("EntraConnectCompromiseOrgA", l_0_0, bm.RelatedStringBMReport)
  end
end
return mp.INFECTED
