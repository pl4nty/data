-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\697_luac 

-- params : ...
-- function num : 0
local l_0_0 = ""
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
  l_0_0 = (string.lower)((this_sigattrlog[2]).utf8p2)
end
if l_0_0 then
  if not (string.match)(l_0_0, ".blf$") or (string.find)(l_0_0, "}.tm.blf", 1, true) or (string.find)(l_0_0, "}.txr.blf", 1, true) then
    return mp.CLEAN
  else
    ;
    (bm.add_related_string)("SuspClfsAccess_CLFS", tostring(l_0_0), bm.RelatedStringBMReport)
  end
end
return mp.INFECTED

