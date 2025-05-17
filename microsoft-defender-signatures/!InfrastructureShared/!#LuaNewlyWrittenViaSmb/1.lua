-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaNewlyWrittenViaSmb\1.luac 

-- params : ...
-- function num : 0
if mp.ENGINEBUILD < 19850 then
  return mp.CLEAN
end
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_ID)
if l_0_0 == 4 then
  local l_0_1, l_0_2 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_REMOTE_SESSION_IP)
  if l_0_1 and l_0_2 and l_0_2 ~= "" then
    (mp.set_mpattribute)("Lua:RemoteContextPresent")
    ;
    (mp.set_mpattribute)("Lua:RemoteIP!" .. l_0_2)
    local l_0_3, l_0_4 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_REMOTE_SESSION_DOMAINNAME)
    if l_0_3 and l_0_4 and l_0_4 ~= "" then
      (mp.set_mpattribute)("Lua:RemoteDom!" .. l_0_4)
    end
    local l_0_5, l_0_6 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_REMOTE_SESSION_USERNAME)
    if l_0_5 and l_0_6 and l_0_6 ~= "" then
      (mp.set_mpattribute)("Lua:RemoteUsr!" .. l_0_6)
    end
    local l_0_7 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
    if not l_0_7 or l_0_7 == "" then
      return mp.CLEAN
    end
    if l_0_7:sub(1, 8) == "\\device\\" then
      l_0_7 = (MpCommon.PathToWin32Path)(l_0_7)
      if l_0_7 then
        l_0_7 = l_0_7:lower()
      else
        return mp.CLEAN
      end
    end
    local l_0_8, l_0_9 = (mp.IsHipsRuleEnabled)("d1e49aac-8f56-4280-b9ba-993a6d77406c")
    if l_0_8 then
      if l_0_9 == 1 then
        (mp.set_mpattribute)("Lua:RemoteHipsRuleEnabledBlock")
        AppendToRollingQueue("file_remote_dropped", l_0_7, 1, 5)
      else
        if l_0_9 == 2 then
          (mp.set_mpattribute)("Lua:RemoteHipsRuleEnabledAudit")
        end
      end
      ;
      (mp.set_mpattribute)("Lua:RemoteHipsRuleEnabled")
    end
    if (mp.get_mpattribute)("BM_MZ_FILE") then
      AppendToRollingQueue("SuspExeFileDroppedViaSMB", l_0_7, nil, 5000)
    else
      AppendToRollingQueue("SuspFileDroppedViaSMB", l_0_7, nil, 5000)
    end
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

