-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\AccessibilityEscalation\0x00001bb3_luac 

-- params : ...
-- function num : 0
if (Remediation.Threat).Active then
  if (string.match)((Remediation.Threat).Name, "Behavior:Win32/AccessibilityEscalation.I") or (string.match)((Remediation.Threat).Name, "Behavior:Win32/AccessibilityEscalation.N") then
    Infrastructure_CleanImageFileDebugger("sethc.exe")
  else
    if (string.match)((Remediation.Threat).Name, "Behavior:Win32/AccessibilityEscalation.J") or (string.match)((Remediation.Threat).Name, "Behavior:Win32/AccessibilityEscalation.O") then
      Infrastructure_CleanImageFileDebugger("utilman.exe")
    else
      if (string.match)((Remediation.Threat).Name, "Behavior:Win32/AccessibilityEscalation.K") or (string.match)((Remediation.Threat).Name, "Behavior:Win32/AccessibilityEscalation.P") then
        Infrastructure_CleanImageFileDebugger("osk.exe")
      else
        if (string.match)((Remediation.Threat).Name, "Behavior:Win32/AccessibilityEscalation.L") or (string.match)((Remediation.Threat).Name, "Behavior:Win32/AccessibilityEscalation.Q") then
          Infrastructure_CleanImageFileDebugger("magnify.exe")
        else
          if (string.match)((Remediation.Threat).Name, "Behavior:Win32/AccessibilityEscalation.M") or (string.match)((Remediation.Threat).Name, "Behavior:Win32/AccessibilityEscalation.R") then
            Infrastructure_CleanImageFileDebugger("narrator.exe")
          else
            if (string.match)((Remediation.Threat).Name, "Behavior:Win32/AccessibilityEscalation.S") then
              Infrastructure_CleanImageFileDebugger("atbroker.exe")
            else
              if (string.match)((Remediation.Threat).Name, "Behavior:Win32/AccessibilityEscalation.AC") then
                Infrastructure_CleanImageFileDebugger("displayswitch.exe")
              end
            end
          end
        end
      end
    end
  end
else
  if (string.match)((Remediation.Threat).Name, "Trojan:Win32/AccessibilityEscalation.C") then
    for l_0_3,l_0_4 in ipairs((Remediation.Threat).Resources) do
      if l_0_4.Schema == "CmdLine" and l_0_4.Path ~= nil and l_0_4.Path ~= "" then
        local l_0_5 = (string.match)(l_0_4.Path, "([^%s]+)")
        if l_0_5 ~= nil and #l_0_5 > 25 and (sysio.IsFileExists)(l_0_5) then
          l_0_5 = (string.lower)(l_0_5)
          local l_0_6, l_0_7 = (string.match)(l_0_5, "^(.*\\)([^\\]+)$")
          local l_0_8 = "\\windows\\system32\\"
          local l_0_9 = {}
          l_0_9["utilman.exe"] = true
          l_0_9["sethc.exe"] = true
          l_0_9["osk.exe"] = true
          l_0_9["magnify.exe"] = true
          l_0_9["narrator.exe"] = true
          l_0_9["displayswitch.exe"] = true
          l_0_9["atbroker.exe"] = true
          if (string.sub)(l_0_6, -#l_0_8) == l_0_8 and l_0_9[l_0_7] ~= nil then
            local l_0_10 = (sysio.GetPEVersionInfo)(l_0_5)
            if l_0_10 and l_0_10.OriginalFilename then
              local l_0_12 = (string.lower)(l_0_10.OriginalFilename)
              if l_0_12 ~= nil and ({["netplwiz.exe"] = true})[l_0_12] ~= nil then
                do
                  (sysio.DeleteFile)(l_0_5)
                  -- DECOMPILER ERROR at PC235: freeLocal<0 in 'ReleaseLocals'

                  -- DECOMPILER ERROR at PC235: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC235: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC235: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC235: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC235: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC235: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC235: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC235: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC235: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC235: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC235: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
    end
  end
end

