local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = string
L0_1 = L0_1.find
L1_1 = Remediation
L1_1 = L1_1.Threat
L1_1 = L1_1.Name
L2_1 = "BrowserModifier:Win32/Hopadef!lnk"
L3_1 = 1
L4_1 = true
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
if L0_1 then
  L0_1 = pairs
  L1_1 = Remediation
  L1_1 = L1_1.Threat
  L1_1 = L1_1.Resources
  L0_1, L1_1, L2_1 = L0_1(L1_1)
  for L3_1, L4_1 in L0_1, L1_1, L2_1 do
    L5_1 = L4_1.Schema
    if L5_1 == "file" then
      L5_1 = string
      L5_1 = L5_1.match
      L6_1 = L4_1.Path
      L7_1 = "(.+\\)([^\\]+)$"
      L5_1, L6_1 = L5_1(L6_1, L7_1)
      L7_1 = string
      L7_1 = L7_1.find
      L8_1 = string
      L8_1 = L8_1.lower
      L9_1 = L6_1
      L8_1 = L8_1(L9_1)
      L9_1 = "g..gl. .hr.m.%.lnk"
      L7_1 = L7_1(L8_1, L9_1)
      if L7_1 == 1 then
        L7_1 = sysio
        L7_1 = L7_1.RegOpenKey
        L8_1 = "HKLM\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\Google Chrome"
        L7_1 = L7_1(L8_1)
        if not L7_1 then
          L8_1 = sysio
          L8_1 = L8_1.RegOpenKey
          L9_1 = "HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\Google Chrome"
          L8_1 = L8_1(L9_1)
          L7_1 = L8_1
        end
        if L7_1 then
          L8_1 = sysio
          L8_1 = L8_1.GetRegValueAsString
          L9_1 = L7_1
          L10_1 = "InstallLocation"
          L8_1 = L8_1(L9_1, L10_1)
          if L8_1 == "C:\\Program Files (x86)\\Google\\Chrome\\Application" then
            L9_1 = MpCommon
            L9_1 = L9_1.SetGlobalMpAttribute
            L10_1 = "LUA:HopadefChromex86"
            L9_1(L10_1)
          elseif L8_1 == "C:\\Program Files\\Google\\Chrome\\Application" then
            L9_1 = MpCommon
            L9_1 = L9_1.SetGlobalMpAttribute
            L10_1 = "LUA:HopadefChromeNox86"
            L9_1(L10_1)
          end
        end
      else
        L7_1 = string
        L7_1 = L7_1.find
        L8_1 = string
        L8_1 = L8_1.lower
        L9_1 = L6_1
        L8_1 = L8_1(L9_1)
        L9_1 = "int.rn.t ...l.r.r%.lnk"
        L7_1 = L7_1(L8_1, L9_1)
        if L7_1 ~= 1 then
          L7_1 = string
          L7_1 = L7_1.find
          L8_1 = string
          L8_1 = L8_1.lower
          L9_1 = L6_1
          L8_1 = L8_1(L9_1)
          L9_1 = "int.rn.t ...l.r.r (n. .dd-.ns)%.lnk"
          L7_1 = L7_1(L8_1, L9_1)
          if L7_1 ~= 1 then
            L7_1 = string
            L7_1 = L7_1.find
            L8_1 = string
            L8_1 = L8_1.lower
            L9_1 = L6_1
            L8_1 = L8_1(L9_1)
            L9_1 = "int.rn.t ...l.r.r (64-bit)%.lnk"
            L7_1 = L7_1(L8_1, L9_1)
            if L7_1 ~= 1 then
              goto lbl_123
            end
          end
        end
        L7_1 = MpCommon
        L7_1 = L7_1.ExpandEnvironmentVariables
        L8_1 = "%program_files%"
        L7_1 = L7_1(L8_1)
        L8_1 = string
        L8_1 = L8_1.find
        L9_1 = string
        L9_1 = L9_1.lower
        L10_1 = L7_1
        L9_1 = L9_1(L10_1)
        L10_1 = " (x86)"
        L11_1 = 1
        L12_1 = true
        L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
        if L8_1 ~= nil then
          L8_1 = MpCommon
          L8_1 = L8_1.SetGlobalMpAttribute
          L9_1 = "LUA:HopadefIEx86"
          L8_1(L9_1)
        else
          L8_1 = MpCommon
          L8_1 = L8_1.SetGlobalMpAttribute
          L9_1 = "LUA:HopadefIENox86"
          L8_1(L9_1)
        end
      end
    end
    ::lbl_123::
  end
end
