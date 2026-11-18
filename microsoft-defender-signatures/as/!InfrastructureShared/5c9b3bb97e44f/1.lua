-- Threat: !InfrastructureShared
-- Name: 5c9b3bb97e44f
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = mp.SIGATTR_LOG_SZ
local r0_1 = {}
local r0_2 = 5
local r0_3 = {}
local r0_4 = 0
for r0_5 = 1, r0_0 do
  local r0_6 = sigattr_tail[r0_5].utf8p2
  if sigattr_tail[r0_5].attribute == 16385
    and string.len(sigattr_tail[r0_5].utf8p1) > 5
    and sigattr_tail[r0_5].utf8p1:byte(1) ~= 37
    and r0_6:find("TotalSizeAppend:0", 1, true) == nil then
    local r0_7 = sigattr_tail[r0_5].utf8p1:lower()
    local r0_8 = r0_7:match("%.[^%.]+$")
    if r0_8 ~= nil then
      local r0_9 = mp.crc32(0, r0_7, 1, #r0_7)
      local r0_10 = {}
      if r0_1[r0_9] == nil then
        r0_1[r0_9] = r0_5
        for r0_11, r0_12 in string.gmatch(r0_6, "(%w+):(%w+)") do
          r0_10[r0_11] = r0_12
        end
        local r0_13 = r0_10.TotalSizeAppend and tonumber(r0_10.TotalSizeAppend) or 0
        if r0_13 > 16 then
          return mp.CLEAN
        end
        local r0_14 = r0_10.LastOff and tonumber(r0_10.LastOff) or 0
        local r0_15 = r0_10.FirstOff and tonumber(r0_10.FirstOff) or 0
        local r0_16 = r0_10.NumWrites and tonumber(r0_10.NumWrites) or 0
        local r0_17 = r0_10.BiggestOff and tonumber(r0_10.BiggestOff) or 0
        local r0_18 = r0_10.SmallestOff and tonumber(r0_10.SmallestOff) or 0
        local r0_19 = r0_10.TotalSizeWrite and tonumber(r0_10.TotalSizeWrite) or 0
        if r0_17 ~= 0
          and r0_15 == 0
          and r0_18 == 0
          and r0_17 == r0_14
          and r0_14 + 1 == r0_19
          and r0_16 > 0
          and r0_13 > 0
          and r0_13 < 16
          and r0_19 % 16 == 0 then
          r0_10.path = sigattr_tail[r0_5].utf8p1
          r0_3[r0_5] = r0_10
          r0_4 = r0_4 + 1
        end
      end
    end
  end
end
local r0_20 = {}
local r0_21 = {}
if r0_2 <= r0_4 then
  for r0_22, r0_23 in pairs(r0_3) do
    local r0_24 = false
    for r0_25 = 1, r0_0 do
      if sigattr_tail[r0_25].attribute == 16386
        and sigattr_tail[r0_25].utf8p2 == sigattr_tail[r0_22].utf8p1 then
        local r0_26 = sigattr_tail[r0_25].utf8p1:lower()
        local r0_27 = sigattr_tail[r0_25].utf8p2:lower()
        local r0_28 = r0_26:match("(.*[/\\])"):lower()
        local r0_29 = r0_27:match("(.*[/\\])")
        local r0_30 = r0_29
        r0_29 = r0_30.lower
        if r0_28 == r0_29(r0_30) and r0_26:byte(#r0_27 + 1) ~= 58 then
          local r0_31 = r0_26:match("(.+)%..+"):lower()
          local r0_32 = r0_27:match("(.+)%..+"):lower()
          local r0_33 = r0_26:match("%.[^%.]+$")
          if r0_33 and r0_32 == r0_31 and mp.GetExtensionClass(r0_33) == 0 then
            if r0_20[r0_33] == nil then
              r0_20[r0_33] = { r0_23 }
            else
              table.insert(r0_20[r0_33], r0_23)
            end
            r0_24 = true
            break
          end
        end
      end
    end
    if r0_24 == false then
      return mp.CLEAN
    end
  end
  for r0_34, r0_35 in pairs(r0_20) do
    if #r0_20[r0_34] >= 4 then
      local r0_36 = {}
      for r0_37 = 1, 4 do
        table.insert(r0_36, r0_20[r0_34][r0_37])
      end
      local r0_38 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
      if isnull(r0_38) then
        local r0_39 = ""
      end
      local r0_40 = bm.get_current_process_startup_info()
      r0_40 = r0_40 ~= nil and -1 or r0_40
      r0_21.rename_ext = r0_34
      r0_21.append_size = "1:16"
      r0_21.file_paths = r0_36
      r0_21.proc_meta_info = r0_40
      local r0_41 = safeJsonSerialize(r0_21)
      bm.add_related_string("gen_ransom_ext_replace", r0_41, bm.RelatedStringBMReport)
      bm.trigger_sig("GenericRansomware:ReplaceExtension2", r0_41)
      reportTimingData()
      sms_untrusted_process()
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
