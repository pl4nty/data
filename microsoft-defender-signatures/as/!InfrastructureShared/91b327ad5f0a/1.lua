-- Threat: !InfrastructureShared
-- Name: 91b327ad5f0a
-- Type: 21
-- Includes: TechniqueTracker

if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  local l_0_0 = string.lower(bm.get_imagepath())
  if string.find(l_0_0, "\\program files", 1, true) or string.find(l_0_0, "regsvr32.exe", 1, true) or string.find(l_0_0, "rundll32.exe", 1, true) or string.find(l_0_0, "svchost.exe", 1, true) or string.find(l_0_0, "onedrive", 1, true) or string.find(l_0_0, "\\google", 1, true) or string.find(l_0_0, "msiexec.exe", 1, true) or string.find(l_0_0, "service.exe", 1, true) then
    return mp.CLEAN
  end
  local l_0_1 = this_sigattrlog[2].utf8p2
  if sysio.IsFileExists(l_0_1) then
    local l_0_2 = string.lower(l_0_1)
    if string.find(l_0_2, "program files", 1, true) or string.find(l_0_2, ".ocx", 1, true) then
      return mp.CLEAN
    end
    if mp.IsKnownFriendlyFile(l_0_1, true, false) == false then
      bm.add_related_file(l_0_1)
      if versioning.IsSeville() and versioning.GetCloudBlockLevel() >= 4 then
        TrackPidAndTechniqueBM("BM", "T1559.001", "interprocess_com_b")
      end
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
