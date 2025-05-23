-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\__MacOSReportLowFiTestA\ObMpAttributes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_0 ~= "/private/tmp/4f4acd0b-bfa7-48bc-992f-386874448d0d-reportlowfitestfile-1.txt" then
  return mp.CLEAN
else
  ;
  (mp.ReportLowfi)(l_0_0, 373957002)
end
return mp.INFECTED

