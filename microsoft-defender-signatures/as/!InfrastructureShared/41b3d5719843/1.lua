-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\41b3d5719843\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched or isnull((this_sigattrlog[1]).utf8p2) then
  return mp.CLEAN
end
local l_0_0 = bm.add_related_string
local l_0_1 = "ExecutableNonTextSection_Process"
local l_0_2 = safeJsonSerialize
local l_0_3 = {}
l_0_3.Embed = (this_sigattrlog[1]).utf8p2 or ""
l_0_3.CreateP1 = (this_sigattrlog[2]).utf8p1 or ""
l_0_3.CreateP2 = (this_sigattrlog[2]).utf8p2 or ""
l_0_3.StartP1 = (this_sigattrlog[3]).utf8p1 or ""
l_0_3.StartP2 = (this_sigattrlog[3]).utf8p2 or ""
l_0_2 = l_0_2(l_0_3)
l_0_3 = bm
l_0_3 = l_0_3.RelatedStringBMReport
l_0_0(l_0_1, l_0_2, l_0_3)
l_0_0 = mp
l_0_0 = l_0_0.INFECTED
return l_0_0

