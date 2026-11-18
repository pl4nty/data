-- Threat: !InfrastructureShared
-- Name: 5e9b3859a3fd3
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = {}
local l_0_3 = {}
local l_0_4 = 0
local l_0_5 = 0
local l_0_6 = 5
local l_0_7 = 0
local l_0_8 = {
  [".log"] = true,
  [".ini"] = true,
  [".xml"] = true,
  [".tmp"] = true,
  [".dat"] = true,
  [".db"] = true,
  [".json"] = true
}
for l_0_9 = 1, l_0_0 do
  local l_0_10 = sigattr_tail[l_0_9].utf8p2
  if sigattr_tail[l_0_9].attribute == 16385 and 5 < string.len(sigattr_tail[l_0_9].utf8p1) and sigattr_tail[l_0_9].utf8p1:byte(1) ~= 37 and l_0_10 and l_0_10:find("TotalSizeAppend:0", 1, true) == nil then
    local l_0_11 = sigattr_tail[l_0_9].utf8p1:lower()
    local l_0_12 = l_0_11:match("%.[^%.]+$")
    if l_0_12 ~= nil and l_0_8[l_0_12] ~= true then
      if l_0_2[l_0_12] == nil then
        l_0_2[l_0_2] = l_0_9
        l_0_5 = l_0_5 + 1
      end
      if l_0_3[l_0_11] == nil then
        l_0_3[l_0_11] = l_0_9
        local l_0_13 = {}
        for l_0_14, l_0_15 in string.gmatch(l_0_10, "(%w+):(%w+)") do
          l_0_13[l_0_14] = l_0_15
        end
        local l_0_16 = tonumber(l_0_13.NumWrites)
        local l_0_17 = tonumber(l_0_13.TotalSizeWrite)
        local l_0_18 = tonumber(l_0_13.TotalSizeAppend)
        if l_0_16 ~= nil and l_0_17 ~= nil and l_0_18 ~= nil and 0 < l_0_16 and 0 < l_0_17 and l_0_17 > l_0_18 and 100 < l_0_18 and l_0_18 < 2000 then
          l_0_1[l_0_9] = l_0_18
          l_0_7 = l_0_7 + l_0_18
          l_0_4 = l_0_4 + 1
        end
      end
    end
  end
end
local l_0_19 = {}
if 0 < l_0_7 and l_0_6 <= l_0_4 and 3 <= l_0_5 then
  local l_0_20 = l_0_7 / l_0_4
  local l_0_21 = 3
  local l_0_22 = 0
  for l_0_23, l_0_24 in pairs(l_0_1) do
    local l_0_25 = l_0_24 * 100 / l_0_20
    if l_0_25 >= 100 - l_0_21 and l_0_25 <= 100 + l_0_21 then
      l_0_22 = l_0_22 + 1
      local l_0_26 = {
        path = sigattr_tail[l_0_23].utf8p1,
        appended_size = l_0_24
      }
      table.insert(l_0_19, l_0_26)
      if l_0_6 <= l_0_22 then
        local l_0_27 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
        local l_0_28 = false
        local l_0_29 = -1
        local l_0_30 = -1
        local l_0_31 = -1
        local l_0_32 = -1
        local l_0_33 = {}
        if not isnull(l_0_27) then
          l_0_28 = MpCommon.QueryPersistContext(l_0_27, "NewPECreatedNoCert")
          l_0_32 = MpCommon.GetPersistContext(l_0_27)
          if l_0_32 ~= nil then
            for l_0_34, l_0_35 in ipairs(l_0_32) do
              local l_0_36 = tonumber(string.match(l_0_35, "^Age:([0-9]+)$"))
              if l_0_36 ~= nil and l_0_29 < l_0_36 then
                l_0_29 = l_0_36
              end
              local l_0_37 = tonumber(string.match(l_0_35, "^Prevalence:([0-9]+)$"))
              if l_0_37 ~= nil and l_0_31 < l_0_37 then
                l_0_31 = l_0_37
              end
            end
          end
          l_0_30 = sysio.GetFileLastWriteTime(l_0_27)
          if sysio.GetLastResult().Success and l_0_30 ~= 0 then
            l_0_30 = MpCommon.GetCurrentTimeT() - (l_0_30 / 10000000 - 11644473600)
          else
            l_0_30 = -1
          end
        else
          l_0_27 = ""
        end
        local l_0_38 = bm.get_current_process_startup_info()
        local l_0_39 = ""
        if l_0_38 ~= nil then
          l_0_39 = l_0_38.command_line
        else
          l_0_38 = -1
        end
        local l_0_40 = {
          cur_image_path = l_0_27,
          cmd_line = l_0_39,
          newpe_nocert = l_0_28,
          elapsed_time = l_0_30,
          file_age = l_0_29,
          file_prevlence = l_0_31
        }
        l_0_33.avg_append_size = l_0_20
        l_0_33.file_paths = l_0_19
        l_0_33.proc_meta_info = l_0_40
        local l_0_41 = safeJsonSerialize(l_0_33)
        bm.add_related_string("genfd_ransom_meta", l_0_41, bm.RelatedStringBMReport)
        bm.trigger_sig("GenericRansomware:FileAppendAvg", l_0_41)
        reportTimingData()
        sms_untrusted_process()
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
