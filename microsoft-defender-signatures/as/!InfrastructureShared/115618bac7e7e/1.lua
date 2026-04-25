-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\115618bac7e7e\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_LOWERCASE, mp.FILEPATH_QUERY_FULL))
if StringEndsWith(l_0_0, "renpy.exe") and (string.match)(l_0_0, "\\renpy%-%d+%.%d+%.?%d*%.?%d*%-sdk\\renpy%.exe$") then
  return mp.CLEAN
end
;
(MpCommon.SetOriginalFileName)(l_0_0, "BM_RENPY_EXE")
return mp.INFECTED

