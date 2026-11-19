-- Threat: !InfrastructureShared
-- Name: 155b3fa3d572e
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  local l_0_3 = this_sigattrlog[1].utf8p2
  if not l_0_3 then
    return mp.CLEAN
  end
  l_0_1 = string.lower(l_0_3):match("create(.*)binpath")
end
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 then
  l_0_0 = this_sigattrlog[3].utf8p1:match("([^\\]+)$")
  l_0_2 = this_sigattrlog[3].image_path
  if not l_0_2 then
    local l_0_4 = this_sigattrlog[3].ppid or ""
    l_0_2 = MpCommon.GetImagePathFromPid(l_0_4)
  end
end
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 then
  l_0_0 = this_sigattrlog[4].utf8p1:match("([^\\]+)$")
  l_0_2 = this_sigattrlog[4].image_path or ""
  if not l_0_2 then
    local l_0_5 = this_sigattrlog[4].ppid or ""
    l_0_2 = MpCommon.GetImagePathFromPid(l_0_5) or ""
  end
end
if not l_0_0 or not l_0_1 then
  return mp.CLEAN
end
if contains(l_0_1, l_0_0) then
  bm.add_related_string("RegisteredSrv", l_0_0, bm.RelatedStringBMReport)
  bm.add_related_string("ProcName_Reg", l_0_2 or "", bm.RelatedStringBMReport)
  local l_0_6 = reportRelevantUntrustedEntities(0)
  if l_0_6 and next(l_0_6) then
    bm.add_related_string("UntrustedEntities", safeJsonSerialize(l_0_6), bm.RelatedStringBMReport)
  end
  if not contains(l_0_2, {
    "reg.exe",
    "regedit.exe"
  }) then
    bm.trigger_sig("TEL_SuspSafebootN", l_0_0 .. "|" .. l_0_2)
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
