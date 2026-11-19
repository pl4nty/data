-- Threat: !InfrastructureShared
-- Name: 86b3b466064e
-- Type: 21
-- Includes: TechniqueTracker

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil and this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  local l_0_1 = string.lower(this_sigattrlog[2].utf8p1)
  local l_0_2 = string.lower(this_sigattrlog[2].utf8p2)
  local l_0_3 = string.match(l_0_1, "\\classes\\(.+)\\shell")
  if l_0_0 ~= l_0_3 then
    return mp.CLEAN
  end
  if string.len(l_0_2) < 4 then
    return mp.CLEAN
  end
  if string.find(l_0_2, "%1", 1, true) then
    return mp.CLEAN
  end
  TrackPidAndTechniqueBM("BM", "T1548.002", "uac_bypass_src")
  local l_0_4 = {}
  table.insert(l_0_4, l_0_2)
  if versioning.IsSeville() and 4 <= versioning.GetCloudBlockLevel() then
    MpCommon.SetPersistContextNoPath("UACBypassExp.T!ShieldUp", l_0_4, 300)
    return mp.INFECTED
  end
  MpCommon.SetPersistContextNoPath("UACBypassExp.T!regset", l_0_4, 10)
  return mp.INFECTED
end
return mp.CLEAN
