-- Threat: !InfrastructureShared
-- Name: 55b30ab35883
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  local l_0_0, l_0_1 = bm.get_process_relationships()
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if l_0_3.image_path ~= nil and l_0_3.ppid ~= nil and string.find(string.lower(l_0_3.image_path), "\\rundll32.exe", 1, true) then
      TrackPidAndTechniqueBM(l_0_3.ppid, "T1218.011", "Proxy_Exec")
      local l_0_4 = extractDllForRegproc(l_0_3.cmd_line)
      if l_0_4 then
        l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_4)
        if sysio.IsFileExists(l_0_4) then
          local l_0_5 = sysio.GetFileLastWriteTime(l_0_4)
          if sysio.GetLastResult().Success and l_0_5 ~= 0 then
            l_0_5 = l_0_5 / 10000000 - 11644473600
            local l_0_6 = MpCommon.GetCurrentTimeT()
            if l_0_5 > l_0_6 or 3600 < l_0_6 - l_0_5 then
              bm.add_related_file(l_0_4)
              return mp.INFECTED
            end
          end
        end
      end
    end
  end
end
return mp.CLEAN
