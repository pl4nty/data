-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5e9b3859a3fd3\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = {}
local l_0_3 = {}
local l_0_4 = 0
local l_0_5 = 0
local l_0_6 = 5
local l_0_7 = 0
local l_0_8 = {}
l_0_8[".log"] = true
l_0_8[".ini"] = true
l_0_8[".xml"] = true
l_0_8[".tmp"] = true
l_0_8[".dat"] = true
l_0_8[".db"] = true
l_0_8[".json"] = true
for l_0_12 = 1, l_0_0 do
  local l_0_13 = (sigattr_tail[l_0_12]).utf8p2
  if (sigattr_tail[l_0_12]).attribute == 16385 and (string.len)((sigattr_tail[l_0_12]).utf8p1) > 5 and ((sigattr_tail[l_0_12]).utf8p1):byte(1) ~= 37 and l_0_13 and l_0_13:find("TotalSizeAppend:0", 1, true) == nil then
    local l_0_14 = ((sigattr_tail[l_0_12]).utf8p1):lower()
    local l_0_15 = l_0_14:match("%.[^%.]+$")
    if l_0_15 ~= nil and l_0_8[l_0_15] ~= true then
      if l_0_2[l_0_15] == nil then
        l_0_2[l_0_2] = l_0_12
        l_0_5 = l_0_5 + 1
      end
      if l_0_3[l_0_14] == nil then
        l_0_3[l_0_14] = l_0_12
        local l_0_16 = {}
        for l_0_20,l_0_21 in (string.gmatch)(l_0_13, "(%w+):(%w+)") do
          l_0_16[l_0_20] = l_0_21
        end
        local l_0_22 = tonumber(l_0_16.NumWrites)
        local l_0_23 = tonumber(l_0_16.TotalSizeWrite)
        local l_0_24 = tonumber(l_0_16.TotalSizeAppend)
        if l_0_22 ~= nil and l_0_23 ~= nil and l_0_24 ~= nil and l_0_22 > 0 and l_0_23 > 0 and l_0_24 < l_0_23 and l_0_24 > 100 and l_0_24 < 2000 then
          l_0_1[l_0_12] = l_0_24
          l_0_7 = l_0_7 + l_0_24
          l_0_4 = l_0_4 + 1
        end
      end
    end
  end
end
local l_0_25 = {}
if l_0_7 > 0 and l_0_6 <= l_0_4 and l_0_5 >= 3 then
  local l_0_26 = (l_0_7) / (l_0_4)
  local l_0_27 = 3
  local l_0_28 = 0
  for l_0_32,l_0_33 in pairs(l_0_1) do
    local l_0_34 = l_0_33 * 100 / l_0_26
    if 100 - l_0_27 <= l_0_34 and l_0_34 <= 100 + l_0_27 then
      l_0_28 = l_0_28 + 1
      local l_0_35 = {}
      l_0_35.path = (sigattr_tail[l_0_32]).utf8p1
      l_0_35.appended_size = l_0_33
      ;
      (table.insert)(l_0_25, l_0_35)
      if l_0_6 <= l_0_28 then
        local l_0_36 = (string.lower)((MpCommon.PathToWin32Path)((bm.get_imagepath)()))
        local l_0_37 = false
        local l_0_38 = -1
        local l_0_39 = -1
        local l_0_40 = -1
        local l_0_41 = -1
        local l_0_42 = {}
        if not isnull(l_0_36) then
          l_0_37 = (MpCommon.QueryPersistContext)(l_0_36, "NewPECreatedNoCert")
          l_0_41 = (MpCommon.GetPersistContext)(l_0_36)
          if l_0_41 ~= nil then
            for l_0_46,l_0_47 in ipairs(l_0_41) do
              local l_0_48 = tonumber((string.match)(l_0_47, "^Age:([0-9]+)$"))
              if l_0_48 ~= nil and l_0_38 < l_0_48 then
                l_0_38 = l_0_48
              end
              local l_0_49 = tonumber((string.match)(l_0_47, "^Prevalence:([0-9]+)$"))
              if l_0_49 ~= nil and l_0_40 < l_0_49 then
                l_0_40 = l_0_49
              end
            end
          end
          do
            l_0_39 = (sysio.GetFileLastWriteTime)(l_0_36)
            if ((sysio.GetLastResult)()).Success and l_0_39 ~= 0 then
              l_0_39 = (MpCommon.GetCurrentTimeT)() - (l_0_39 / 10000000 - 11644473600)
            else
              l_0_39 = -1
            end
            l_0_36 = ""
            local l_0_50 = (bm.get_current_process_startup_info)()
            local l_0_51 = ""
            if l_0_50 ~= nil then
              l_0_51 = l_0_50.command_line
            else
              l_0_50 = -1
            end
            local l_0_52 = {}
            l_0_52.cur_image_path = l_0_36
            l_0_52.cmd_line = l_0_51
            l_0_52.newpe_nocert = l_0_37
            l_0_52.elapsed_time = l_0_39
            l_0_52.file_age = l_0_38
            l_0_52.file_prevlence = l_0_40
            l_0_42.avg_append_size = l_0_26
            l_0_42.file_paths = l_0_25
            l_0_42.proc_meta_info = l_0_52
            do
              local l_0_53 = safeJsonSerialize(l_0_42)
              ;
              (bm.add_related_string)("genfd_ransom_meta", l_0_53, bm.RelatedStringBMReport)
              ;
              (bm.trigger_sig)("GenericRansomware:FileAppendAvg", l_0_53)
              reportTimingData()
              sms_untrusted_process()
              do return mp.INFECTED end
              -- DECOMPILER ERROR at PC278: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC278: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC278: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC278: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC278: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC278: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC278: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
end
l_0_26 = mp
l_0_26 = l_0_26.CLEAN
return l_0_26

