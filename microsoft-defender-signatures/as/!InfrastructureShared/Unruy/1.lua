-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unruy\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = Remediation.Threat
if l_0_0.Active then
  (Remediation.SetRebootRequired)()
end
if (string.match)(l_0_0.Name, "TrojanDownloader:Win32/Unruy%.R") then
  local l_0_1 = l_0_0.Resources
  if l_0_1 then
    for l_0_5,l_0_6 in ipairs(l_0_1) do
      if l_0_6.Schema == "file" then
        local l_0_7, l_0_25, l_0_42 = l_0_6.Path
        l_0_25 = Infrastructure_SplitThreatPath
        l_0_42 = l_0_7
        l_0_25 = l_0_25(l_0_42)
        local l_0_8, l_0_9, l_0_10, l_0_11, l_0_26, l_0_27, l_0_28, l_0_29, l_0_43, l_0_44, l_0_45, l_0_46 = nil
        l_0_10 = nil
        local l_0_12, l_0_30, l_0_47 = nil
        if l_0_25 and l_0_8 then
          l_0_11 = l_0_8
          local l_0_13 = nil
          if l_0_9 then
            l_0_26 = string
            l_0_26 = l_0_26.sub
            l_0_27 = l_0_8
            l_0_28 = 1
            l_0_29 = #l_0_9
            l_0_29 = -l_0_29
            l_0_29 = l_0_29 - 2
            l_0_26 = l_0_26(l_0_27, l_0_28, l_0_29)
            l_0_11 = l_0_26
          end
          l_0_26 = sysio
          l_0_26 = l_0_26.FindFiles
          l_0_27 = l_0_25
          l_0_28 = l_0_11
          l_0_29 = "*"
          l_0_28 = l_0_28 .. l_0_29
          l_0_29 = 0
          l_0_26 = l_0_26(l_0_27, l_0_28, l_0_29)
          local l_0_14 = nil
          if l_0_26 then
            l_0_27 = pairs
            l_0_28 = l_0_26
            l_0_27 = l_0_27(l_0_28)
            for l_0_43,l_0_44 in l_0_27 do
              local l_0_15, l_0_16, l_0_17, l_0_18, l_0_19 = nil
              l_0_45 = Infrastructure_SplitThreatPath
              l_0_46 = l_0_44
              l_0_45 = l_0_45(l_0_46)
              local l_0_38, l_0_39, l_0_40, l_0_55, l_0_56, l_0_57 = nil
              if l_0_30 == nil then
                local l_0_36, l_0_37, l_0_53, l_0_54 = nil
                l_0_10 = l_0_44
              end
            end
          end
        end
        do
          if l_0_7 and l_0_7 ~= "" then
            l_0_11 = sysio
            l_0_11 = l_0_11.DeleteFile
            l_0_26 = l_0_7
            l_0_11(l_0_26)
          end
          if l_0_10 and l_0_10 ~= "" then
            local l_0_24, l_0_41 = nil
            l_0_11 = sysio
            l_0_11 = l_0_11.MoveFile
            l_0_26 = l_0_10
            l_0_11(l_0_26, l_0_7)
            l_0_11 = sysio
            l_0_11 = l_0_11.SetFileAttributes
            local l_0_31, l_0_48 = nil
            l_0_26 = l_0_7
            local l_0_32, l_0_49 = nil
            do
              local l_0_33, l_0_50 = nil
              l_0_11(l_0_26, 128)
              -- DECOMPILER ERROR at PC90: Confused about usage of register R19 for local variables in 'ReleaseLocals'

              -- DECOMPILER ERROR at PC90: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC90: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC90: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC90: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC90: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC90: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
  local l_0_20 = nil
  local l_0_21 = nil
  local l_0_22 = nil
  local l_0_23 = nil
  ;
  (Remediation.SetRemovalPolicy)((crypto.bitor)((Remediation.Threat).RemovalPolicy, 4))
  if l_0_0.Active then
    do
      (Remediation.SetRebootRequired)()
      -- DECOMPILER ERROR at PC108: Confused about usage of register R18 for local variables in 'ReleaseLocals'

    end
  end
end

