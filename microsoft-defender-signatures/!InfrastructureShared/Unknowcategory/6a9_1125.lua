-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6a9_1125.luac 

-- params : ...
-- function num : 0
local l_0_0 = ""
local l_0_1 = ""
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
  l_0_0 = (string.lower)((this_sigattrlog[2]).utf8p2)
end
if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 ~= nil then
  l_0_0 = (string.lower)((this_sigattrlog[3]).utf8p1)
end
if (this_sigattrlog[4]).matched then
  l_0_1 = (this_sigattrlog[4]).ppid
end
if (this_sigattrlog[5]).matched then
  l_0_1 = (this_sigattrlog[5]).ppid
end
if l_0_0 then
  if not (string.match)(l_0_0, ".blf$") or (string.find)(l_0_0, "\\tencent\\", 1, true) or (string.find)(l_0_0, "\\qiyi\\", 1, true) or (string.find)(l_0_0, "\\sysevr\\", 1, true) or (string.find)(l_0_0, "\\matlab\\", 1, true) or (string.find)(l_0_0, "\\jenkins\\", 1, true) or (string.find)(l_0_0, "ntuser.dat", 1, true) or (string.find)(l_0_0, "}.tm.blf", 1, true) or (string.find)(l_0_0, "}.txr.blf", 1, true) then
    return mp.CLEAN
  else
    ;
    (bm.add_related_string)("SuspClfsAccess_CLFS", tostring(l_0_0), bm.RelatedStringBMReport)
  end
end
if l_0_1 ~= nil then
  (bm.request_SMS)(l_0_1, "L")
end
return mp.INFECTED

