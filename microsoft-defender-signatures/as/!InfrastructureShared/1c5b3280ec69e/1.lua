-- Threat: !InfrastructureShared
-- Name: 1c5b3280ec69e
-- Type: 21
-- Includes: TechniqueTracker, LuaFuncHelper

if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil and this_sigattrlog[3].matched then
  local l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
  if string.find(l_0_0, "\\pdqinventory", 1, true) or string.find(l_0_0, "\\pdqdeployrunner", 1, true) or string.find(l_0_0, "\\veeam", 1, true) or string.find(l_0_0, "\\bomgar", 1, true) or string.find(l_0_0, "\\patchagent", 1, true) or string.find(l_0_0, "\\ccm", 1, true) or string.find(l_0_0, "\\dwrcs", 1, true) or string.find(l_0_0, "\\hewlett-packard", 1, true) or string.find(l_0_0, "tenable_mw", 1, true) or string.find(l_0_0, "framepkg", 1, true) then
    return mp.CLEAN
  end
  local l_0_1 = l_0_0:match("([^\\]+)$")
  l_0_1 = l_0_1:match("(.+%.exe).-$")
  local l_0_2, l_0_3 = bm.get_process_relationships()
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    local l_0_6 = string.lower(MpCommon.PathToWin32Path(l_0_5.image_path))
    if l_0_5.reason == bm.RELATIONSHIP_CREATED and string.find(l_0_6, l_0_1, 1, true) then
      local l_0_7 = IsKeyInRollingQueue("SuspExeFileDroppedViaSMB", l_0_6, true)
      if l_0_7 then
        local l_0_8, l_0_9 = bm.get_process_relationships(l_0_5.ppid)
        for l_0_10, l_0_11 in ipairs(l_0_9) do
          if l_0_11.reason == bm.RELATIONSHIP_CREATED then
            bm.add_related_process(l_0_11.ppid)
            TrackPidAndTechniqueBM(l_0_11.ppid, "T1021.002", "remoteservice_created_a")
          end
        end
        mp.ReportLowfi(l_0_6, 3598935839)
        bm.add_related_file(l_0_6)
        TrackPidAndTechniqueBM(l_0_5.ppid, "T1021.002", "remoteservice_svc_a")
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
