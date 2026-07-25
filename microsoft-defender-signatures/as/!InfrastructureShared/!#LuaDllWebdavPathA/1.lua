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
  if (mp.get_mpattribute)("MpOnFileExecuteRtpScan") and (mp.get_mpattribute)("Lua:ExecuteSingleExportDLL.A") then
    (mp.set_mpattribute)("Lua:SuspDllLoadInWebdav")
  end
  return mp.INFECTED
end
return mp.CLEAN

