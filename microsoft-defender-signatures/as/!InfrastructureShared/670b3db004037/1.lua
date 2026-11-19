-- Threat: !InfrastructureShared
-- Name: 670b3db004037
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0, l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
  l_0_1 = "(c:\\\\user.*(desktop|downloads|documents|pictures|music|videos)|c:\\\\programdata)([\\\\*%]+)?$"
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
  l_0_1 = "\\\\\\\\%.*%$"
end
if l_0_0 then
  local l_0_2 = "hklm\\\\software(\\\\policies)?\\\\microsoft\\\\(windows defender|microsoft antimalware)\\\\exclusions\\\\paths\\\\\\\\"
  if not MpCommon.StringRegExpSearch(l_0_2, l_0_0) or not MpCommon.StringRegExpSearch(l_0_1, l_0_0) then
    return mp.CLEAN
  end
  local l_0_3 = bm.get_current_process_startup_info()
  if not l_0_3 or not l_0_3.ppid then
    return mp.CLEAN
  end
  local l_0_4 = bm.get_imagepath() or l_0_3.image_path
  if not l_0_4 then
    return mp.CLEAN
  end
  if l_0_4 and contains(l_0_4, "svchost.exe") then
    local l_0_5 = "SigHitCount_Exclusions_Susp"
    local l_0_6 = l_0_0
    local l_0_7 = 86400
    local l_0_8, l_0_9 = IsKeyInRollingQueue(l_0_5, l_0_6)
    local l_0_10 = {}
    l_0_10.count = l_0_9
    l_0_10.key = l_0_6
    if not l_0_9 then
      AppendToRollingQueue(l_0_5, l_0_6, 1, l_0_7, 100)
      add_parents()
      bm.add_related_string("AppliedThroughPolicy", safeJsonSerialize(l_0_10), bm.RelatedStringBMReport)
      return mp.INFECTED
    elseif l_0_9 then
      l_0_9 = tonumber(l_0_9)
      if l_0_9 < 5 then
        AppendToRollingQueue(l_0_5, l_0_6, l_0_9 + 1, l_0_7, 100)
        add_parents()
        bm.add_related_string("AppliedThroughPolicy", safeJsonSerialize(l_0_10), bm.RelatedStringBMReport)
        return mp.INFECTED
      else
        AppendToRollingQueue(l_0_5, l_0_6, l_0_9 + 1, l_0_7, 100)
        return mp.CLEAN
      end
    end
  end
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN
