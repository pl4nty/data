-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6a785d967701\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_LOWERCASE, mp.FILEPATH_QUERY_FULL))
if not StringEndsWith(l_0_0, ".exe") then
  return mp.CLEAN
end
if (StringEndsWith(l_0_0, "ocefsubprocess.exe") or StringEndsWith(l_0_0, "gspawn1.exe")) and ((string.find)(l_0_0, ":\\program files", 1, true) or (string.find)(l_0_0, "\\origin", 1, true) or (string.find)(l_0_0, "\\temp\\mount", 1, true) or (string.find)(l_0_0, "\\microsoft\\windows\\", 1, true)) then
  return mp.CLEAN
end
;
(MpCommon.SetOriginalFileName)(l_0_0, "BM_OCEFSUBPROCESS_EXE")
return mp.INFECTED

