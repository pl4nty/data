-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\68a_luac 

-- params : ...
-- function num : 0
local l_0_0 = ""
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
  l_0_0 = (string.lower)((this_sigattrlog[2]).utf8p2)
end
if l_0_0 then
  (bm.add_related_string)("SuspClfsAccess_CLFS", tostring(l_0_0), bm.RelatedStringBMReport)
end
return mp.INFECTED

