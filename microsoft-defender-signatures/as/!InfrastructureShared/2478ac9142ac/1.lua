-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2478ac9142ac\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
local l_0_1 = l_0_0:match("^(.*\\)")
local l_0_2 = l_0_1 .. "log.cached"
if (sysio.IsFileExists)(l_0_2) then
  (mp.ReportLowfi)(l_0_2, 3952868898)
end
return mp.INFECTED

