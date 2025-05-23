-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFASRCALL01443614-cd74-433a-b\1.luac 

-- params : ...
-- function num : 0
if not (mp.IsHipsRuleEnabled)("01443614-cd74-433a-b99e-2ecdc07bfc25") then
  return mp.CLEAN
end
local l_0_0 = (mp.get_parent_filehandle)()
if not (mp.is_handle_nil)(l_0_0) then
  return mp.CLEAN
end
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_1 = (versioning.GetOsBuildNumber)()
if (mp.get_contextdata)(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) == true or l_0_1 < 10240 then
  local l_0_2 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
  if l_0_2 ~= nil and l_0_2 ~= "" then
    l_0_2 = (string.lower)((MpCommon.PathToWin32Path)(l_0_2))
    if (mp.IsPathExcludedForHipsRule)(l_0_2, "01443614-cd74-433a-b99e-2ecdc07bfc25") then
      return mp.CLEAN
    end
    local l_0_3 = (versioning.GetOrgID)()
    if l_0_3 ~= nil and l_0_3 ~= "" then
      l_0_3 = (string.lower)(l_0_3)
    end
    if l_0_3 == "ede93498-0189-4b5a-bb7d-bdb374cbebd3" and (string.find)(l_0_2, "^.:\\program files\\safebreach\\safebreach endpoint simulator\\app\\") ~= nil then
      return mp.CLEAN
    end
    if (string.find)(l_0_2, "^.:\\programdata\\chocolatey\\bin\\[^%.\\]+%.exe$") ~= nil then
      return mp.CLEAN
    end
    if (string.find)(l_0_2, (string.lower)((MpCommon.ExpandEnvironmentVariables)("%systemroot%")) .. "\\system32\\mrt.exe", 1, true) ~= nil then
      return mp.CLEAN
    end
    if (string.find)(l_0_2, "^.:\\windows\\") ~= nil then
      local l_0_4 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
      if l_0_4 ~= nil and l_0_4 ~= "" and (string.lower)(l_0_4) == "powershell.exe" then
        local l_0_5 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
        if l_0_5 ~= nil then
          local l_0_6 = (mp.GetProcessCommandLine)(l_0_5)
          if l_0_6 ~= nil and #l_0_6 > 50 and (string.find)((string.lower)(l_0_6), "-executionpolicy allsigned .+windows defender advanced threat protection\\datacollection") ~= nil then
            return mp.CLEAN
          end
        end
      end
    end
  end
  do
    do
      if (mp.IsTrustedFile)(false) == false then
        return mp.INFECTED
      end
      return mp.CLEAN
    end
  end
end

