-- Threat: !InfrastructureShared
-- Name: b7b3758dc861
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, AppomalyHelpers

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0, r0_1 = nil, 0
local r0_2 = {}
if this_sigattrlog[1].matched and this_sigattrlog[2].matched then
  local r0_3 = this_sigattrlog[1].utf8p2
  local r0_4 = this_sigattrlog[2].utf8p2
  if not r0_4 then
    return mp.CLEAN
  end
  local r0_5 = string.lower(r0_3)
  r0_3 = r0_5
  r0_5 = string.lower(r0_4)
  r0_4 = r0_5
  if r0_4 == r0_3 or r0_4 == "" then
    return mp.CLEAN
  end
  local r0_6 = string.find(r0_4, "script:", 1, true)
  if r0_6 then
    r0_1 = r0_1 + 500
    r0_2.new_value = r0_4
    r0_2.old_value = r0_3
  else
    local r0_7 = isSimilarPath(r0_4, r0_3, 80, 3)
    if r0_7 then
      return mp.CLEAN
    end
    local r0_8 = string.match
    r0_8 = r0_8(r0_4, "%w:\\.*.exe") or string.match(r0_4, "%w:\\.*.dll")
    local r0_9 = string.match
    r0_9 = r0_9(r0_3, "%w:\\.*.exe") or string.match(r0_3, "%w:\\.*.dll")
    r0_2.new_value = r0_8
    r0_2.old_value = r0_9
    if r0_3 ~= ""
      and r0_8
      and r0_9
      and string.match(r0_8, "([^\\]+)$") ~= string.match(r0_9, "([^\\]+)$") then
      r0_1 = r0_1 + 10
    end
    local r0_10 = string.gsub(r0_8, "\\", "\\\\")
    local r0_11 = r0_10
    local r0_12 = r0_11:gsub("([%^%$%(%)%.%[%]%*%+%-%?])", "\\%1")
    r0_10 = r0_12
    r0_12 = pcall
    r0_11 = MpCommon
    local r0_13, r0_14 = r0_12(r0_11.RollingQueueQueryKeyRegex,
      "RQ_RecentExecDropped_MultipleKey_30m", r0_10)
    if not (r0_13 and r0_14) then
      return mp.CLEAN
    end
    local r0_15 = r0_14.value and { r0_14 } or r0_14
    r0_2.FileDroppedRecently = true
    r0_2.FileInfo = r0_15
    for r0_16, r0_17 in ipairs(r0_15) do
      local r0_18 = string.find(r0_17.value, "UnsignedFile", 1, true)
      if r0_18 then
        local r0_19 = string.match(r0_17.value, "Process_Img(.*)")
        if r0_19 and contains(r0_19, { "explorer.exe", "WinRAR.exe", "7z.exe" }) then
          r0_1 = r0_1 + 20
        end
        local r0_20 = MpCommon.StringRegExpSearch("\\\\(desktop|download|onedrive|document|picture)",
          r0_17.key)
        if r0_20 then
          r0_1 = r0_1 + 50
        end
        r0_20 = string
        r0_20 = r0_20.find
        r0_20 = r0_20(r0_17.value, "FileAttributes", 1, true)
        if r0_20 then
          local r0_21 = string.match(r0_17.value, "%[(.*)%]")
          for r0_22 in string.gmatch(r0_21, "([^|]+)") do
            local r0_23 = string.find(r0_22, "Aurora.A!rfn", 1, true)
            if not r0_23 then
              r0_1 = r0_1 + 5
            end
            if r0_22 == "SLF:HighRiskHasMotW" then
              r0_1 = r0_1 + 100
            end
          end
        end
        break
      end
    end
  end
  local r0_24 = string.find
  local r0_25 = this_sigattrlog[2].utf8p1
  r0_0 = nil
  r0_24 = r0_24(r0_25, "HKCU\\", 1, true)
  if r0_24 then
    local r0_26 = string.gsub(this_sigattrlog[2].utf8p1, "HKCU\\", "HKLM\\")
    local r0_27 = GetRegistryValue(r0_26, "") or ""
    r0_27 = string.lower(r0_27)
    if not (r0_27 == r0_4 or isSimilarPath(r0_4, r0_27, 80, 3)) then
      r0_1 = r0_1 + 10
      r0_2.hklm_value = r0_27
    end
  end
  local r0_28 = false
  if r0_1 >= 500 then
    local r0_29 = bm.get_current_process_startup_info()
    if r0_29 and r0_29.ppid then
      r0_0 = bm.get_imagepath
      r0_0 = r0_0() or ""
      local r0_30 = mp.GetProcessCommandLine
      r0_30 = r0_30(r0_29.ppid) or ""
      local r0_31 = contains(r0_0, "reg.exe")
      r0_28 = r0_31 and contains(r0_30, " add ") and true or r0_28
      r0_31 = contains
      r0_31 = r0_31(r0_0, "powershell")
      if r0_31 then
        local r0_32, r0_33 = string.gsub(r0_30, "%$", "")
        if r0_33 > 6 then
          r0_28 = true
        end
      end
    end
  end
  if r0_1 > 15 then
    r0_2.score = r0_1
    local r0_34 = add_parents()
    r0_2.parents = r0_34
    r0_2.should_block = r0_28
    r0_34 = safeJsonSerialize
    r0_34 = r0_34(r0_2)
    bm.add_related_string("AdditionalInfo", r0_34, bm.RelatedStringBMReport)
    bm.add_related_file(r0_2.new_value)
    if r0_28 then
      return mp.INFECTED
    end
    bm.trigger_sig("Susp_TypeLibHijacking", r0_34)
  end
end
return mp.CLEAN
