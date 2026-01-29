-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9bb3bcf7aeae\1.luac 

-- params : ...
-- function num : 0
if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
local l_0_0 = nil
if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 ~= nil then
  l_0_0 = (string.lower)((this_sigattrlog[3]).utf8p1)
end
if isnull(l_0_0) then
  return mp.CLEAN
end
if not (MpCommon.QueryPersistContext)(l_0_0, "MpNewlyCreatedHint_5m") then
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
local l_0_1 = normalize_path((bm.get_imagepath)())
if isnull(l_0_1) then
  return mp.CLEAN
end
if not (MpCommon.QueryPersistContext)(l_0_1, "MpNewlyCreatedHint_5m") then
  return mp.CLEAN
end
return mp.INFECTED

