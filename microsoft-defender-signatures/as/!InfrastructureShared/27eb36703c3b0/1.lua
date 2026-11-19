-- Threat: !InfrastructureShared
-- Name: 27eb36703c3b0
-- Type: 21

if bm.GetSignatureMatchDuration() > 20000000 then
  return mp.CLEAN
end
if this_sigattrlog[1].matched and this_sigattrlog[4].matched and MpCommon.GetPersistContextCountNoPath("UACBypassExp.ZK!dllhost") > 0 then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
  if string.find(l_0_0, "\\taskcache\\tree\\microsoft\\", 1, true) or string.find(l_0_0, "\\atp onboarding\\", 1, true) or string.find(l_0_0, "\\microsoftedgeupdate", 1, true) or string.find(l_0_0, "\\monitoring", 1, true) then
    return mp.CLEAN
  end
  local l_0_1, l_0_2 = bm.get_process_relationships()
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    local l_0_5 = MpCommon.GetProcessElevationAndIntegrityLevel(l_0_4.ppid)
    local l_0_6 = mp.bitand(l_0_4.reason_ex, bm.RELATIONSHIP_CREATED)
    if l_0_6 == bm.RELATIONSHIP_CREATED and l_0_5.IntegrityLevel == MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
      local l_0_7 = string.lower(MpCommon.PathToWin32Path(l_0_4.image_path))
      local l_0_8 = string.lower(MpCommon.PathToWin32Path(this_sigattrlog[4].utf8p1))
      if l_0_7 == l_0_8 then
        local l_0_9 = string.lower(this_sigattrlog[4].utf8p2)
        if not string.find(l_0_9, "windowsdefenderatponboardingscript", 1, true) and not string.find(l_0_9, "taskhostw.exe", 1, true) then
          bm.add_related_process(l_0_4.ppid)
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
