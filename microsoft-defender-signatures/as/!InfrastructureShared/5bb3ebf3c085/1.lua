-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb3ebf3c085\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0, l_1_1)
  -- function num : 0_0
  local l_1_2 = l_1_0 .. " "
  local l_1_3 = l_1_1 .. ".exe"
  for l_1_7,l_1_8 in (string.gmatch)(l_1_2, "([^%s\"\'\\/|;&(]+)()") do
    if (l_1_7 == l_1_1 or l_1_7 == l_1_3) and (string.find)((string.sub)(l_1_2, l_1_8, l_1_8), "[%s\"\']") then
      return true
    end
  end
  return false
end

local l_0_2 = function(l_2_0)
  -- function num : 0_1 , upvalues : l_0_0
  if type(l_2_0) ~= "string" or l_2_0 == "" then
    return false
  end
  l_2_0 = (string.lower)(l_2_0)
  do
    if not (string.find)(l_2_0, "http://", 1, true) then
      local l_2_1 = (string.find)(l_2_0, "https://", 1, true)
    end
    -- DECOMPILER ERROR at PC30: Confused about usage of register: R1 in 'UnsetPending'

    if not l_2_1 then
      return false
    end
    local l_2_2 = nil
    if contains(l_2_0, {"invoke-webrequest", "invoke-restmethod"}) then
      return true
    end
    if (string.find)(l_2_0, "%.downloadstring%s*%(") or (string.find)(l_2_0, "%.downloadfile%s*%(") then
      return true
    end
    local l_2_3 = nil
    -- DECOMPILER ERROR at PC80: Confused about usage of register: R3 in 'UnsetPending'

    if l_0_0(l_2_0, "bitsadmin") and (string.find)(l_2_0 .. " ", "/transfer[%s\"\']") and not (string.find)(l_2_0 .. " ", "/upload[%s\"\']") then
      return true
    end
    if contains(l_2_0, "start-bitstransfer") and (string.find)(l_2_0, "%-source%s+[\"\']?https?://") then
      return true
    end
    if (string.find)(l_2_0, "[%s\"\'(|;=,]iwr[%s\"\'(]") then
      return true
    end
    if (string.find)(l_2_0, "[%s\"\'(|;=,]irm[%s\"\'(]") then
      return true
    end
    if l_0_0(l_2_0, "curl") or l_0_0(l_2_0, "wget") then
      return true
    end
    if (string.find)(l_2_0, "certutil", 1, true) and ((string.find)(l_2_0, "-urlcache", 1, true) or (string.find)(l_2_0, "http", 1, true)) then
      return true
    end
    if (string.find)(l_2_0, "msiexec", 1, true) and (string.find)(l_2_0, "http", 1, true) then
      return true
    end
    if (string.find)(l_2_0, "mshta", 1, true) and (string.find)(l_2_0, "http", 1, true) then
      return true
    end
    return false
  end
end

if not (bm.get_current_process_startup_info)() or not next((bm.get_current_process_startup_info)()) then
  return mp.CLEAN
end
local l_0_3 = nil
do
  if l_0_3.command_line then
    local l_0_4 = nil
    l_0_4[#{} + 1] = l_0_3.command_line
  end
  local l_0_5 = nil
  do
    if (mp.GetParentProcInfo)() and ((mp.GetParentProcInfo)()).ppid then
      local l_0_6 = nil
      l_0_5[#l_0_5 + 1] = (mp.GetProcessCommandLine)(l_0_6.ppid)
    end
    local l_0_7, l_0_8, l_0_9 = , pcall(bm.get_process_relationships, l_0_3.ppid)
    if l_0_8 then
      if type(l_0_9) == "table" then
        for l_0_13,l_0_14 in ipairs(l_0_9) do
          local l_0_10 = nil
          -- DECOMPILER ERROR at PC55: Confused about usage of register: R12 in 'UnsetPending'

          if R12_PC55.ppid then
            l_0_5[#l_0_5 + 1] = (mp.GetProcessCommandLine)(l_0_15.ppid)
          end
        end
      end
      do
        -- DECOMPILER ERROR at PC68: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC73: Confused about usage of register: R7 in 'UnsetPending'

        if type(l_0_10) == "table" then
          for l_0_19,l_0_20 in ipairs(l_0_10) do
            local l_0_16 = nil
            -- DECOMPILER ERROR at PC76: Confused about usage of register: R12 in 'UnsetPending'

            if l_0_15.ppid then
              l_0_5[#l_0_5 + 1] = (mp.GetProcessCommandLine)(l_0_21.ppid)
            end
          end
        end
        do
          local l_0_22 = nil
          local l_0_23 = {"169.254.169.254", "metadata.google", "metadata.azure", "\\.vscode\\extensions\\"}
          for l_0_27,l_0_28 in ipairs(l_0_5) do
            local l_0_24 = nil
            if not l_0_24 and l_0_2((mp.GetProcessCommandLine)(l_0_21.ppid)) and not contains((mp.GetProcessCommandLine)(l_0_21.ppid), l_0_23) then
              l_0_24 = (mp.GetProcessCommandLine)(l_0_21.ppid)
            end
          end
          -- DECOMPILER ERROR at PC115: Confused about usage of register: R9 in 'UnsetPending'

          if not l_0_24 then
            return mp.CLEAN
          end
          -- DECOMPILER ERROR at PC122: Confused about usage of register: R9 in 'UnsetPending'

          local l_0_29 = nil
          local l_0_30 = (string.lower)(l_0_24)
          -- DECOMPILER ERROR at PC134: Overwrote pending register: R11 in 'AssignReg'

          if l_0_7 and l_0_7.image_path then
            local l_0_31 = ""
            local l_0_32 = contains
            do
              local l_0_33 = l_0_31
              l_0_32 = l_0_32(l_0_33, {"agentexecutor.exe", "\\code.exe", "windowsterminal.exe", "consctlx.exe", "reload.exe", "\\escan\\"})
              if l_0_32 then
                l_0_32 = mp
                l_0_32 = l_0_32.CLEAN
                return l_0_32
              end
              l_0_32 = contains
              l_0_33 = l_0_30
              l_0_32 = l_0_32(l_0_33, {"runmru", "\\run\\"})
              if not l_0_32 then
                l_0_32 = contains
                l_0_33 = l_0_31
                l_0_32 = l_0_32(l_0_33, {"\\explorer.exe", "\\mshta.exe"})
              end
              if l_0_32 then
                l_0_32 = bm
                l_0_32 = l_0_32.add_related_string
                l_0_33 = "[->] CLICKFIX ORIGIN: "
                l_0_32(l_0_33, l_0_31, bm.RelatedStringBMReport)
              end
              l_0_32 = bm
              l_0_32 = l_0_32.add_related_string
              l_0_33 = "[->] CLICKFIX DOWNLOADER (AMSI-corroborated): "
              l_0_32(l_0_33, l_0_29, bm.RelatedStringBMReport)
              l_0_32 = bm_AddRelatedFileFromCommandLine
              l_0_33 = l_0_30
              l_0_32(l_0_33, nil, nil, 1)
              l_0_32 = l_0_3.ppid
              if l_0_32 then
                l_0_32 = bm
                l_0_32 = l_0_32.request_SMS
                l_0_33 = l_0_3.ppid
                l_0_32(l_0_33, "h+")
                l_0_32 = bm
                l_0_32 = l_0_32.add_action
                l_0_33 = "SmsAsyncScanEvent"
                l_0_32(l_0_33, 1)
              end
              l_0_32 = triggerMemoryScanOnProcessTree
              l_0_33 = true
              l_0_32(l_0_33, true, "SMS_H", 5000, "Behavior:Win32/AmsiFailClickFixDownloader.AM")
              l_0_32 = add_parents
              l_0_32()
              l_0_32 = mp
              l_0_32 = l_0_32.INFECTED
              do return l_0_32 end
              -- DECOMPILER ERROR at PC213: freeLocal<0 in 'ReleaseLocals'

            end
          end
        end
      end
    end
  end
end

