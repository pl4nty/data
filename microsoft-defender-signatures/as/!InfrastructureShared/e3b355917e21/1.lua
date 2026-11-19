-- Threat: !InfrastructureShared
-- Name: e3b355917e21
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 then
  local l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
  local l_0_1 = "\\\\(\\w{1,2}:(\\\\*)?\\*?%?$)"
  local l_0_2, l_0_3 = MpCommon.StringRegExpSearch(l_0_1, l_0_0)
  if l_0_2 then
    local l_0_4 = bm.get_current_process_startup_info()
    if not l_0_4 or not l_0_4.ppid then
      return mp.CLEAN
    end
    local l_0_5 = bm.get_imagepath() or l_0_4.image_path
    if not l_0_5 then
      return mp.CLEAN
    end
    if l_0_5 and contains(l_0_5, "svchost.exe") then
      local l_0_6 = "SigHitCount_Exclusions_FullDrive"
      local l_0_7 = l_0_0
      local l_0_8 = 86400
      local l_0_9, l_0_10 = IsKeyInRollingQueue(l_0_6, l_0_7)
      local l_0_11 = {}
      l_0_11.count = l_0_10
      l_0_11.key = l_0_7
      if not l_0_10 then
        AppendToRollingQueue(l_0_6, l_0_7, 1, l_0_8, 100)
        add_parents()
        bm.add_related_string("AppliedThroughPolicy", safeJsonSerialize(l_0_11), bm.RelatedStringBMReport)
        return mp.INFECTED
      elseif l_0_10 then
        l_0_10 = tonumber(l_0_10)
        if l_0_10 < 5 then
          AppendToRollingQueue(l_0_6, l_0_7, l_0_10 + 1, l_0_8, 100)
          add_parents()
          bm.add_related_string("AppliedThroughPolicy", safeJsonSerialize(l_0_11), bm.RelatedStringBMReport)
          return mp.INFECTED
        else
          AppendToRollingQueue(l_0_6, l_0_7, l_0_10 + 1, l_0_8, 100)
          return mp.CLEAN
        end
      end
    else
      add_parents()
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
