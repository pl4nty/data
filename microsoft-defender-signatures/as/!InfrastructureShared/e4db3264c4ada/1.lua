-- Threat: !InfrastructureShared
-- Name: e4db3264c4ada
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if mp.get_sigattr_event_count(16525) < 10 or 10 > mp.get_sigattr_event_count(16387) and mp.get_sigattr_event_count(16385) < 9 or 10 > mp.get_sigattr_event_count(16384) and 10 > mp.get_sigattr_event_count(16386) or 10 > mp.get_sigattr_event_count(16389) then
  return mp.CLEAN
end

local function l_0_0()
  return {
    MpCommon.ExpandEnvironmentVariables("%ProgramFiles%"):lower(),
    MpCommon.ExpandEnvironmentVariables("%ProgramFiles(x86)%"):lower(),
    MpCommon.ExpandEnvironmentVariables("%windir%"):lower(),
    mp.ContextualExpandEnvironmentVariables("%APPDATA%"):lower(),
    mp.ContextualExpandEnvironmentVariables("%LOCALAPPDATA%"):lower(),
    MpCommon.ExpandEnvironmentVariables("%ProgramData%"):lower(),
    MpCommon.ExpandEnvironmentVariables("%PUBLIC%"):lower(),
    MpCommon.ExpandEnvironmentVariables("system"):lower()
  }
end

local l_0_1 = 90
local l_0_2 = 1000
local l_0_3 = 0
local l_0_4 = 0
local l_0_5 = 0
local l_0_6 = 0
local l_0_7 = 0
local l_0_8 = 0
local l_0_9 = bm.get_current_process_startup_info()
local l_0_10 = l_0_9.ppid
local l_0_11 = bm.get_imagepath():lower()
local l_0_12 = {}
local l_0_13 = {}
local l_0_14 = {}
local l_0_15 = {}
local l_0_16 = "DafrRQ"
local l_0_17 = l_0_10 .. "SeqRead:"
local l_0_18 = l_0_10 .. "DelFile:"
local l_0_19 = l_0_10 .. "CrtFile:"
local l_0_20 = l_0_10 .. "RenFile:"
local l_0_21 = l_0_10 .. "ChgFile:"
local l_0_22 = l_0_10 .. "MetFile:"
local l_0_23 = l_0_10 .. "Threshold:"
local l_0_24 = l_0_10 .. "Timing:"
for l_0_25 = 1, mp.SIGATTR_LOG_SZ do
  if sigattr_tail[l_0_25].attribute == 16525 or sigattr_tail[l_0_25].attribute == 16387 or sigattr_tail[l_0_25].attribute == 16384 or sigattr_tail[l_0_25].attribute == 16385 or sigattr_tail[l_0_25].attribute == 16386 or sigattr_tail[l_0_25].attribute == 16389 and sigattr_tail[l_0_25].utf8p2:lower() == "attr_c09458eb" then
    do
      local l_0_26 = sigattr_tail[l_0_25].utf8p1:lower()
      local l_0_27 = l_0_26:match("(.+)[/\\].+")
      local l_0_28 = false
      local l_0_29 = "%.[^%.%\\]+$"
      if l_0_26:byte(1) == 37 or l_0_27 == "" or l_0_27 == nil then
        l_0_28 = true
      end
      if not l_0_28 then
        if next(l_0_12) == nil then
          l_0_12 = l_0_0()
        end
        for l_0_30, l_0_31 in ipairs(l_0_12) do
          if l_0_26:find(l_0_31) then
            l_0_28 = true
            break
          end
        end
      end
      
      local function l_0_32(l_2_0)
        local l_2_1 = l_2_0:match(l_0_29)
        if l_2_1 ~= nil then
          l_2_1 = l_2_1:lower()
          local l_2_2 = mp.GetExtensionClass(l_2_1)
          if l_2_2 == 1 or l_2_2 == 4 or l_2_2 == 0 then
            return false
          else
            return true
          end
        else
          return false
        end
      end
      
      if not l_0_28 then
        if sigattr_tail[l_0_25].attribute == 16525 then
          l_0_3 = l_0_3 + 1
          l_0_14[l_0_17 .. l_0_26] = l_0_27
        elseif sigattr_tail[l_0_25].attribute == 16387 then
          if l_0_32(l_0_26) then
            l_0_4 = l_0_4 + 1
            l_0_14[l_0_18 .. l_0_26] = l_0_27
          end
        elseif sigattr_tail[l_0_25].attribute == 16384 then
          l_0_5 = l_0_5 + 1
          l_0_14[l_0_19 .. l_0_26] = l_0_27
        elseif sigattr_tail[l_0_25].attribute == 16386 then
          local l_0_33 = sigattr_tail[l_0_25].utf8p2:lower()
          if l_0_32(l_0_33) then
            l_0_6 = l_0_6 + 1
            l_0_14[l_0_20 .. l_0_33] = l_0_26
          end
        elseif sigattr_tail[l_0_25].attribute == 16385 then
          l_0_7 = l_0_7 + 1
          l_0_14[l_0_21 .. l_0_26] = sigattr_tail[l_0_25].utf8p2:lower()
        elseif sigattr_tail[l_0_25].attribute == 16389 then
          l_0_8 = l_0_8 + 1
          l_0_14[l_0_22 .. l_0_26] = sigattr_tail[l_0_25].utf8p2:lower()
        end
        if 10 <= l_0_3 and (10 <= l_0_4 or 10 <= l_0_7) and (10 <= l_0_5 or 10 <= l_0_6) and 10 <= l_0_8 then
          for l_0_34 in pairs(l_0_14) do
            local l_0_35 = string.format("%s", l_0_34)
            if string.sub(l_0_35, 1, #l_0_17) == l_0_17 then
              table.insert(l_0_15, string.sub(l_0_35, #l_0_17 + 1))
            end
          end
          for l_0_36, l_0_37 in pairs(l_0_15) do
            local l_0_38 = string.match(l_0_37, "[^\\]+$")
            local l_0_39 = l_0_14[l_0_17 .. l_0_37]
            local l_0_40 = l_0_39 .. "\\.*\\" .. l_0_38
            local l_0_41 = 0 < l_0_4 and l_0_14[l_0_18 .. l_0_37] or false
            local l_0_42
            if 0 < l_0_6 then
              local l_0_43
              l_0_42 = l_0_14[l_0_20 .. l_0_37]
              if l_0_42 then
                l_0_43 = tostring(l_0_42):lower():gsub("(:\\users)\\[%w._@']+", "%1\\PII_")
                table.insert(l_0_13, "RenamedTo:" .. l_0_43)
              else
                local l_0_44 = l_0_37:match("(.*)%.%w+$")
                local l_0_45 = l_0_14[l_0_20 .. l_0_44]
                l_0_42 = l_0_45 == l_0_37
                if l_0_42 then
                  l_0_43 = tostring(l_0_44):lower():gsub("(:\\users)\\[%w._@']+", "%1\\PII_")
                  table.insert(l_0_13, "RenamedFrom:" .. l_0_43)
                end
              end
            end
            local l_0_46 = 0 < l_0_7 and l_0_14[l_0_21 .. l_0_37] or false
            
            local function l_0_47(l_3_0, l_3_1)
              l_3_1 = string.gsub(l_3_1, "%?", ".")
              l_3_1 = string.gsub(l_3_1, "%-", "%%-")
              for l_3_2 in pairs(l_3_0) do
                if string.find(l_3_2, l_3_1, 1, false) then
                  return l_3_2
                end
              end
              return nil
            end
            
            local l_0_48
            if 0 < l_0_5 then
              l_0_48 = l_0_47(l_0_14, l_0_19 .. l_0_37)
              l_0_48 = l_0_48 or l_0_47(l_0_14, l_0_19 .. l_0_40)
              if l_0_48 then
                local l_0_49 = tostring(l_0_48):lower():gsub("(:\\users)\\[%w._@']+", "%1\\PII_")
                table.insert(l_0_13, "Created:" .. l_0_49:sub(#l_0_19 + 1))
              end
            end
            local l_0_50 = l_0_47(l_0_14, l_0_22 .. l_0_37) or l_0_47(l_0_14, l_0_22 .. l_0_40)
            if l_0_50 and (l_0_41 and l_0_48 or l_0_42 and l_0_46) then
              local l_0_51 = l_0_41 and l_0_48 and "_CreateDelete_" or "_RenameChange_"
              if not IsKeyInRollingQueue(l_0_16, l_0_23 .. l_0_51) then
                AppendToRollingQueue(l_0_16, l_0_23 .. l_0_51, 1, l_0_1, l_0_2)
                AppendToRollingQueue(l_0_16, l_0_24 .. l_0_51, MpCommon.GetCurrentTimeT() or -1, l_0_1, l_0_2)
              else
                local l_0_52 = tonumber(GetRollingQueueKeyValue(l_0_16, l_0_24 .. l_0_51)) or -1
                local l_0_53 = MpCommon.GetCurrentTimeT() or -2
                local l_0_54 = l_0_53 - l_0_52
                if l_0_54 < 0 or 90 < l_0_54 then
                  AppendToRollingQueue(l_0_16, l_0_23 .. l_0_51, 1, l_0_1, l_0_2)
                  AppendToRollingQueue(l_0_16, l_0_24 .. l_0_51, MpCommon.GetCurrentTimeT() or -1, l_0_1, l_0_2)
                  return mp.CLEAN
                end
                local l_0_55 = tonumber(GetRollingQueueKeyValue(l_0_16, l_0_23 .. l_0_51))
                if 10 <= l_0_55 then
                  bm.trigger_sig("GenericRansomware", "Type0")
                  local l_0_56 = {}
                  for l_0_57, l_0_58 in pairs(l_0_15) do
                    local l_0_59 = string.gsub(l_0_58:lower(), "(:\\users)\\[%w._@']+", "%1\\PII_")
                    table.insert(l_0_56, l_0_59)
                  end
                  local l_0_60 = {
                    ThresholdValue = l_0_55,
                    HeurType = l_0_51,
                    CountStartTime = l_0_52,
                    CountEndTime = l_0_53,
                    DeletedFileCount = l_0_4,
                    CreatedFileCount = l_0_5,
                    RenamedFileCount = l_0_6,
                    ChangedFileCount = l_0_7,
                    TamperedFiles = l_0_56,
                    CreatedRenamed = l_0_13,
                    ImagePath = l_0_11,
                    BMHitCount = bm.get_sig_count()
                  }
                  local l_0_61 = safeJsonSerialize(l_0_60)
                  reportSessionInformationInclusive()
                  bm.add_related_string("GenericRansomware", l_0_61, bm.RelatedStringBMReport)
                  reportTimingData()
                  return mp.INFECTED
                else
                  AppendToRollingQueue(l_0_16, l_0_23 .. l_0_51, l_0_55 + 1, l_0_1, l_0_2)
                end
              end
            end
          end
        end
      end
    end
  end
end
return mp.CLEAN
