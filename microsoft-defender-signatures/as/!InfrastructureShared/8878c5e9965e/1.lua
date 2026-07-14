-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\8878c5e9965e\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_LOWERCASE, mp.FILEPATH_QUERY_FULL))
if StringEndsWith(l_0_0, "xii_uninit.exe") and ((string.find)(l_0_0, ":\\program files", 1, true) or (string.find)(l_0_0, "\\vgn vhub", 1, true)) then
  return mp.CLEAN
end
;
(MpCommon.SetOriginalFileName)(l_0_0, "BM_XIIUNINIT_EXE")
return mp.INFECTED

