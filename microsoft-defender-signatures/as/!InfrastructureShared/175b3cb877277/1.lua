-- Threat: !InfrastructureShared
-- Name: 175b3cb877277
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if not l_0_0 or not l_0_0.ppid then
  return mp.CLEAN
end
local l_0_1, l_0_2 = MpCommon.GetProcessProtection(l_0_0.ppid)
if l_0_1 and l_0_1 == 0 then
  return mp.CLEAN
end
local l_0_3
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 then
  l_0_3 = this_sigattrlog[4].utf8p1
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 then
  l_0_3 = this_sigattrlog[5].utf8p1
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 then
  l_0_3 = this_sigattrlog[6].utf8p1
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p1 then
  l_0_3 = this_sigattrlog[7].utf8p1
end
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = mp.GetParentProcInfo()
if l_0_4 and l_0_4.ppid then
  local l_0_5, l_0_6 = MpCommon.GetProcessProtection(l_0_4.ppid)
  if l_0_5 and l_0_5 == 0 then
    if l_0_4.image_path then
      local l_0_7 = l_0_4.image_path:match("([^\\]+)$") or ""
      local l_0_8 = l_0_3:match("([^\\]+)$") or ""
      if mp.IsKnownFriendlyFile(l_0_4.image_path, true, false) and string.lower(l_0_8) == string.lower(l_0_7) then
        return mp.CLEAN
      end
      if checkParentCmdlineCaseInsensitive(l_0_0.ppid, {
        {
          "svchost",
          "WerSvcGroup"
        }
      }, 3) then
        return mp.CLEAN
      end
      bm.add_related_string("PPlProcessParent", l_0_4.image_path, bm.RelatedStringBMReport)
    end
    bm.add_related_string("PPlLevel", l_0_5 .. "_" .. (l_0_2 or "Error"), bm.RelatedStringBMReport)
    add_parents()
    return mp.INFECTED
  end
end
return mp.CLEAN
