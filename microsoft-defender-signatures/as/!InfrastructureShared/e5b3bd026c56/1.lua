-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\e5b3bd026c56\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = this_sigattrlog[3]
if isnull(l_0_0.utf8p1) or isnull(l_0_0.utf8p2) then
  return mp.CLEAN
end
local l_0_1 = (string.match)(l_0_0.utf8p2, "apcroutinevadregiontype:(%d+)")
if isnull(l_0_1) then
  return mp.CLEAN
end
if tonumber(l_0_1) == 16777216 then
  return mp.CLEAN
end
local l_0_2, l_0_3, l_0_4 = (string.match)(l_0_0.utf8p1, "imagename:(.+);targetprocessppid:(%d+):(%d+)$")
if isnull(l_0_3) or isnull(l_0_4) then
  return mp.CLEAN
end
local l_0_5 = (string.format)("pid:%d,ProcessStart:%d", l_0_3, l_0_4)
local l_0_6 = (mp.GetProcessCommandLine)(l_0_5)
if l_0_6 then
  (bm.add_related_string)("bmInfoInjectedProcCommandLine", l_0_6, bm.RelatedStringBMReport)
end
local l_0_7, l_0_8 = pcall(reportBmInfo)
if not l_0_7 and l_0_8 then
  (bm.add_related_string)("bmInfoFailReason", tostring(l_0_8), bm.RelatedStringBMReport)
end
return mp.INFECTED

