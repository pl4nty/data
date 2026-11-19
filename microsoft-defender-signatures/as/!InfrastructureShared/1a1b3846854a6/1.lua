-- Threat: !InfrastructureShared
-- Name: 1a1b3846854a6
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, AppomalyHelpers

local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4
if this_sigattrlog[1].matched and this_sigattrlog[3].matched then
  l_0_3 = tostring(this_sigattrlog[1].utf8p2 or "")
  l_0_4 = tostring(this_sigattrlog[3].utf8p2 or "")
  l_0_3 = l_0_3:gsub("[\128-\255]", "")
  l_0_4 = l_0_4:gsub("[\128-\255]", "")
  if l_0_4 == "" then
    return mp.CLEAN
  end
  if l_0_3 ~= "" and l_0_3 ~= l_0_4 then
    if isSimilarPath(l_0_4, l_0_3, 80, 4) then
      return mp.CLEAN
    end
    l_0_1 = true
    l_0_2 = "old_value_mismatch" .. "InProcServer32"
    l_0_0 = string.match(this_sigattrlog[3].utf8p1, "({.-})")
  elseif string.find(this_sigattrlog[3].utf8p1, "HKCU\\", 1, true) then
    local l_0_5 = string.gsub(this_sigattrlog[3].utf8p1, "HKCU\\", "HKLM\\")
    local l_0_6 = GetRegistryValue(l_0_5, "")
    l_0_6 = l_0_6:gsub("[\128-\255]", "")
    if l_0_6 and l_0_6 ~= "" and l_0_6 ~= l_0_4 then
      l_0_3 = l_0_6
      if isSimilarPath(l_0_4, l_0_6, 80, 4) then
        return mp.CLEAN
      end
      l_0_1 = true
      l_0_2 = "hklm_hkcu_mismatch" .. "InProcServer32"
      l_0_0 = string.match(this_sigattrlog[3].utf8p1, "({.-})")
    end
  end
end
if this_sigattrlog[2].matched and this_sigattrlog[4].matched then
  l_0_3 = tostring(this_sigattrlog[2].utf8p2 or "")
  l_0_4 = tostring(this_sigattrlog[4].utf8p2 or "")
  l_0_3 = l_0_3:gsub("[\128-\255]", "")
  l_0_4 = l_0_4:gsub("[\128-\255]", "")
  if l_0_4 == "" then
    return mp.CLEAN
  end
  if l_0_3 ~= "" and l_0_3 ~= l_0_4 then
    if isSimilarPath(l_0_4, l_0_3, 80, 4) then
      return mp.CLEAN
    end
    l_0_1 = true
    l_0_2 = "old_value_mismatch" .. "LocalServer32"
    l_0_0 = string.match(this_sigattrlog[4].utf8p1, "({.-})")
  elseif string.find(this_sigattrlog[4].utf8p1, "HKCU\\", 1, true) then
    local l_0_7 = string.gsub(this_sigattrlog[4].utf8p1, "HKCU\\", "HKLM\\")
    local l_0_8 = GetRegistryValue(l_0_7, "")
    l_0_8 = l_0_8:gsub("[\128-\255]", "")
    if l_0_8 and l_0_8 ~= "" and l_0_8 ~= l_0_4 then
      l_0_3 = l_0_8
      if isSimilarPath(l_0_4, l_0_8, 80, 4) then
        return mp.CLEAN
      end
      l_0_1 = true
      l_0_2 = "hklm_hkcu_mismatch" .. "LocalServer32"
      l_0_0 = string.match(this_sigattrlog[4].utf8p1, "({.-})")
    end
  end
end
if l_0_1 then
  local l_0_9 = 0
  local l_0_10 = {}
  l_0_10.parents = add_parents()
  l_0_10.processname = bm.get_imagepath()
  l_0_10.reason = l_0_2
  l_0_10.appId = l_0_0
  l_0_4 = string.lower(l_0_4)
  l_0_3 = string.lower(l_0_3)
  l_0_4 = string.match(l_0_4, "%w:\\.*.exe") or string.match(l_0_4, "%w:\\.*.dll")
  l_0_3 = string.match(l_0_3, "%w:\\.*.exe") or string.match(l_0_3, "%w:\\.*.dll")
  l_0_10.From_Value = l_0_3
  l_0_10.To_value = l_0_4
  if string.match(l_0_4, "([^\\]+)$") ~= string.match(l_0_3, "([^\\]+)$") then
    l_0_9 = l_0_9 + 10
  end
  local l_0_11 = string.gsub(l_0_4, "\\", "\\\\")
  l_0_11 = l_0_11:gsub("([%^%$%(%)%.%[%]%*%+%-%?])", "\\%1")
  local l_0_12, l_0_13 = pcall(MpCommon.RollingQueueQueryKeyRegex, "RQ_RecentExecDropped_MultipleKey_30m", l_0_11)
  if l_0_12 and l_0_13 then
    if l_0_13.value then
      l_0_13 = {l_0_13}
    end
    l_0_10.FileDroppedRecently = true
    l_0_10.FileInfo = l_0_13
    for l_0_14, l_0_15 in ipairs(l_0_13) do
      if string.find(l_0_15.value, "UnsignedFile", 1, true) then
        l_0_9 = l_0_9 + 20
        break
      end
    end
  else
    return mp.CLEAN
  end
  l_0_10.Score = l_0_9
  if l_0_9 == 0 then
    return mp.CLEAN
  end
  local l_0_16 = safeJsonSerialize(l_0_10) or l_0_10.processname or ""
  bm.add_related_string("AdditionalInfo", l_0_16, bm.RelatedStringBMReport)
  bm.add_related_file(l_0_4)
  return mp.INFECTED
end
return mp.CLEAN
