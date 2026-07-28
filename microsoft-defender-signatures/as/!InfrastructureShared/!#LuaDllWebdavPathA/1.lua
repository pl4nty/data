-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaDllWebdavPathA\1.luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_0 = (MpCommon.PathToWin32Path)((mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)))
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0:sub(1, 2) == "\\\\" and ((string.find)(l_0_0, "@ssl\\", 1, true) or (string.find)(l_0_0, "@80\\", 1, true) or (string.find)(l_0_0, "@ssl@443\\", 1, true) or (string.find)(l_0_0, "@443\\", 1, true)) then
  if (mp.get_mpattribute)("MpOnFileExecuteRtpScan") then
    local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
    if l_0_1 then
      l_0_1 = (string.lower)(l_0_1)
      if l_0_1 == "rundll32.exe" then
        local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
        if l_0_2 then
          local l_0_3 = (mp.GetProcessCommandLine)(l_0_2)
          if l_0_3 then
            l_0_3 = (string.lower)(l_0_3)
            if (string.find)(l_0_3, ",#1", 1, true) then
              (mp.set_mpattribute)("Lua:SuspDllLoadInWebdav")
            end
          end
        end
      end
    end
  end
  do
    do return mp.INFECTED end
    return mp.CLEAN
  end
end

