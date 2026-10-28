-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3cb32ea11ee4\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = this_sigattrlog[1]
if l_0_0 == nil or not l_0_0.matched or l_0_0.utf8p2 == nil then
  return mp.CLEAN
end
local l_0_1, l_0_2 = nil, nil
l_0_1 = IsProcNameInParentProcessTree("BM", "svchost.exe")
if not l_0_1 or not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = (string.lower)(l_0_0.utf8p2)
if l_0_3 == nil or #l_0_3 < 10 or #l_0_3 > 256 then
  return mp.CLEAN
end
local l_0_4 = (string.match)(l_0_3, "mshta%.exe.-(https?://[^%s%?%)%]%}%\'\"&|<>;,]+)")
if l_0_4 == nil or #l_0_4 < 10 then
  return mp.CLEAN
end
local l_0_5 = {}
l_0_5.SIG_CONTEXT = "BM"
l_0_5.CONTENT_SOURCE = "CmdLine"
l_0_5.PROCESS_CONTEXT = "mshta.exe"
l_0_5.BREAK_AT_FIRST_HIT_MALWARE = "60"
l_0_5.FILELESS = "true"
l_0_5.CMDLINE_URL = "true"
l_0_5.SIG_REFERENCE = "Behavior:Win32/WalletThief.A"
l_0_5.CMDLINE_MATCH = l_0_3
local l_0_6 = CheckUrlReputationSimple
local l_0_7 = {}
-- DECOMPILER ERROR at PC67: No list found for R7 , SetList fails

-- DECOMPILER ERROR at PC68: Overwrote pending register: R8 in 'AssignReg'

l_0_6 = l_0_6(l_0_7, l_0_4, 60)
if not l_0_6 then
  l_0_7 = mp
  l_0_7 = l_0_7.CLEAN
  return l_0_7
end
l_0_7 = "HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Schedule\\TaskCache\\Tasks"
local l_0_8 = "HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Schedule\\TaskCache\\Tree"
local l_0_9 = (sysio.RegOpenKey)(l_0_7)
if not l_0_9 then
  return mp.CLEAN
end
local l_0_10 = (sysio.RegEnumKeys)(l_0_9)
if not l_0_10 then
  return mp.CLEAN
end
local l_0_11 = (MpCommon.ExpandEnvironmentVariables)("%windir%")
if l_0_11 == nil or l_0_11 == "" or l_0_11 == "%windir%" then
  return mp.CLEAN
end
local l_0_12 = false
do
  local l_0_13 = 0
  for l_0_17,l_0_18 in ipairs(l_0_10) do
    if l_0_13 < 8 and type(l_0_18) == "string" and (string.match)(l_0_18, "^%{%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x%}$") then
      local l_0_19 = l_0_7 .. "\\" .. l_0_18
      local l_0_20 = (sysio.RegOpenKey)(l_0_19)
      if l_0_20 then
        local l_0_21 = (sysio.GetRegValueAsString)(l_0_20, "Path")
        local l_0_22 = (sysio.GetRegValueAsBinary)(l_0_20, "Actions")
        if type(l_0_21) == "string" and #l_0_21 > 1 and #l_0_21 <= 256 and (string.sub)(l_0_21, 1, 1) == "\\" and not (string.find)(l_0_21, "..\\", 1, true) and not (string.find)(l_0_21, "\\..", 1, true) and not (string.find)(l_0_21, "/", 1, true) and not (string.find)(l_0_21, ":", 1, true) and type(l_0_22) == "string" and #l_0_22 > 0 and #l_0_22 < 2048 then
          local l_0_23 = (string.lower)((string.gsub)(l_0_22, "%z", ""))
          local l_0_24 = (string.match)(l_0_23, "mshta%.exe.-(https?://[^%s%?%)%]%}%\'\"&|<>;,]+)")
          if not l_0_24 == l_0_4 then
            l_0_24 = (string.match)(l_0_23, "powershell.exe.-(https?://[^%s%?%)%]%}%\'\"&|<>;,]+)")
          end
          -- DECOMPILER ERROR at PC269: Unhandled construct in 'MakeBoolean' P3

          -- DECOMPILER ERROR at PC275: Confused about usage of register: R21 in 'UnsetPending'

          if (l_0_24 ~= l_0_4 or not (string.find)(l_0_23, "iex", 1, true)) and (string.find)(l_0_23, "create", 1, true) then
            local l_0_31 = nil
            local l_0_32 = nil
            local l_0_33 = nil
            -- DECOMPILER ERROR at PC289: Overwrote pending register: R28 in 'AssignReg'

            if not ((sysio.RegOpenKey)(l_0_8 .. l_0_21)) or nil == l_0_18 then
              l_0_12 = true
              local l_0_34 = nil
              -- DECOMPILER ERROR at PC304: Confused about usage of register: R26 in 'UnsetPending'

              if AppendToRollingQueue("WalletThief_Queue", "TreeKey", l_0_8 .. l_0_21, 300, 32, 0) then
                local l_0_35 = nil
                -- DECOMPILER ERROR at PC324: Confused about usage of register: R30 in 'UnsetPending'

                -- DECOMPILER ERROR at PC336: Confused about usage of register: R30 in 'UnsetPending'

                if (sysio.IsFileExists)(l_0_11 .. "\\System32\\Tasks" .. l_0_31) and (not AppendToRollingQueue("WalletThief_Queue", "TaskFile", l_0_11 .. "\\System32\\Tasks" .. l_0_31, 300, 32, 0)) or AppendToRollingQueue("WalletThief_Queue", "TasksKey", l_0_19, 300, 32, 0) then
                  (bm.add_related_string)("WtTaskFile", l_0_11 .. "\\System32\\Tasks" .. l_0_31, bm.RelatedStringBMReport)
                end
                do
                  local l_0_36 = nil
                  -- DECOMPILER ERROR at PC354: Confused about usage of register: R31 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC366: Confused about usage of register: R31 in 'UnsetPending'

                  if (sysio.IsFileExists)(l_0_11 .. "\\Tasks" .. l_0_31 .. ".job") and (not AppendToRollingQueue("WalletThief_Queue", "TaskFile", l_0_11 .. "\\Tasks" .. l_0_31 .. ".job", 300, 32, 0)) or AppendToRollingQueue("WalletThief_Queue", "TasksKey", l_0_19, 300, 32, 0) then
                    (bm.add_related_string)("WtTaskFile", l_0_11 .. "\\Tasks" .. l_0_31 .. ".job", bm.RelatedStringBMReport)
                  end
                  if AppendToRollingQueue("WalletThief_Queue", "TasksKey", l_0_19, 300, 32, 0) then
                    l_0_13 = l_0_13 + 1
                    ;
                    (bm.add_related_string)("WtTaskId", l_0_18, bm.RelatedStringBMReport)
                    ;
                    (bm.add_related_string)("WtTaskPath", l_0_31, bm.RelatedStringBMReport)
                  end
                  -- DECOMPILER ERROR at PC387: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC387: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC387: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC387: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC387: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC387: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC387: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC387: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC387: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC387: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC387: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC387: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
    end
  end
  -- DECOMPILER ERROR at PC389: Confused about usage of register: R12 in 'UnsetPending'

  if not l_0_12 then
    return mp.CLEAN
  end
  ;
  (bm.add_related_string)("WtInfectedUrl", l_0_4, bm.RelatedStringBMReport)
  ;
  (bm.add_threat_process)(l_0_2)
  do return mp.INFECTED end
  -- DECOMPILER ERROR at PC408: freeLocal<0 in 'ReleaseLocals'

  -- DECOMPILER ERROR: 11 unprocessed JMP targets
end

