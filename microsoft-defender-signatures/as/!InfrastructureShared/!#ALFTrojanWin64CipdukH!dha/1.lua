-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanWin64CipdukH!dha\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL) .. "mui"
if (sysio.IsFileExists)(l_0_0) then
  (mp.ReportLowfi)(l_0_0, 4215686520)
end
return mp.CLEAN

