-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00001b5a_luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("MpOnCloseNewlyCreatedHintRtpScan") then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 and ((string.find)(l_0_0, "\\config\\systemprofile\\appdata\\local\\crashdumps\\", 1, true) or (string.find)(l_0_0, "\\programdata\\microsoft\\windows\\wer\\", 1, true) or (string.find)(l_0_0, "\\windows\\logs\\pbr\\", 1, true) or (string.find)(l_0_0, "\\programdata\\norton\\", 1, true)) then
  return mp.CLEAN
end
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_1 then
  local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
  if l_0_2 then
    l_0_2 = (MpCommon.PathToWin32Path)(l_0_2)
    local l_0_3 = (string.lower)(l_0_2 .. "\\" .. l_0_1)
    if (string.find)(l_0_3, "\\program files\\palo alto networks\\", 1, true) or (string.find)(l_0_3, "\\program files\\microsoft system center 2022\\", 1, true) or (string.find)(l_0_3, "\\windows\\cluster\\clussvc.exe", 1, true) or (string.find)(l_0_3, "watchdog\\bin\\", 1, true) or (string.find)(l_0_3, "\\windows\\explorer.exe", 1, true) or (string.find)(l_0_3, "\\pmd\\processdumpeaplugin.exe", 1, true) then
      return mp.CLEAN
    end
    ;
    (mp.set_mpattribute)("MpInternal_researchdata=parentprocesspath=" .. l_0_3)
  end
end
do
  local l_0_4 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
  if l_0_4 ~= nil and (string.find)((string.lower)(l_0_4), "pid:4,", 1, true) then
    return mp.CLEAN
  end
  return mp.INFECTED
end

