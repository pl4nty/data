-- Threat: !InfrastructureShared
-- Name: 1c5b372ee9d1f
-- Type: 21
-- Includes: TechniqueTracker

if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil and this_sigattrlog[3].matched then
  local l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
  local l_0_1 = l_0_0:match("([^\\]+)$")
  local l_0_2, l_0_3 = bm.get_process_relationships()
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    local l_0_6 = string.lower(MpCommon.PathToWin32Path(l_0_5.image_path))
    if l_0_5.reason == bm.RELATIONSHIP_CREATED and string.find(l_0_6, l_0_1, 1, true) then
      local l_0_7 = MpCommon.QueryPersistContext(l_0_6, "PsExecServiceStandardName")
      if l_0_7 then
        local l_0_8, l_0_9 = bm.get_process_relationships(l_0_5.ppid)
        for l_0_10, l_0_11 in ipairs(l_0_9) do
          if l_0_11.reason == bm.RELATIONSHIP_CREATED then
            bm.add_related_process(l_0_11.ppid)
            TrackPidAndTechniqueBM(l_0_11.ppid, "T1021.002", "psexec_remoteservice_created_b")
          end
        end
        TrackPidAndTechniqueBM(l_0_5.ppid, "T1021.002", "remoteservice_svc_b")
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
