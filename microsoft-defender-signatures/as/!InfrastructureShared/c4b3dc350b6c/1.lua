-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c4b3dc350b6c\1.luac 

-- params : ...
-- function num : 0
if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
local l_0_0 = nil
if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 ~= nil then
  l_0_0 = (string.lower)((this_sigattrlog[4]).utf8p1)
end
if isnull(l_0_0) then
  return mp.CLEAN
end
if not (sysio.IsFileExists)(l_0_0) then
  return mp.CLEAN
end
if (mp.IsKnownFriendlyFile)(l_0_0, true, false) == true then
  return mp.CLEAN
end
;
(bm.add_related_file)(l_0_0)
return mp.INFECTED

