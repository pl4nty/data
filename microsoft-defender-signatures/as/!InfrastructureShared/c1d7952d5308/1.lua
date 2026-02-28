local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = L1_1.ppid
  if L2_1 ~= nil then
    L2_1 = L1_1.ppid
    if L2_1 ~= "" then
      goto lbl_25
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_25::
L2_1 = mp
L2_1 = L2_1.GetProcessCommandLine
L3_1 = L1_1.ppid
L2_1 = L2_1(L3_1)
L3_1 = mp
L3_1 = L3_1.GetExecutablesFromCommandLine
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L4_1 = {}
L4_1[".bat"] = true
L4_1[".cmd"] = true
L4_1[".ps1"] = true
L5_1 = 4
L6_1 = {}
L7_1 = ":\\saw\\system\\sawhealthcheck.ps1$"
L8_1 = ":\\saw\\user\\sawhealthcheck.ps1$"
L9_1 = "\\microsoft intune management extension\\policies\\scripts\\"
L10_1 = ":\\windows\\imecache\\healthscripts\\.+%.ps1$"
L11_1 = "\\vdi_scripts\\defenderatp\\defenderatp.ps1$"
L12_1 = ":\\agent\\enableagent.ps1$"
L13_1 = ":\\programdata\\amazon\\ssm\\.+\\runpowershellscript\\_script.ps1$"
L14_1 = ":\\svcfab\\_app\\.+\\svc\\setupnightwatch.bat$"
L15_1 = ":\\work\\cloudtest\\preconfig.cmd$"
L16_1 = "%w\\bin\\defender%-exclusions.ps1$"
L6_1[1] = L7_1
L6_1[2] = L8_1
L6_1[3] = L9_1
L6_1[4] = L10_1
L6_1[5] = L11_1
L6_1[6] = L12_1
L6_1[7] = L13_1
L6_1[8] = L14_1
L6_1[9] = L15_1
L6_1[10] = L16_1
L7_1 = ipairs
L8_1 = L3_1
L7_1, L8_1, L9_1 = L7_1(L8_1)
for L10_1, L11_1 in L7_1, L8_1, L9_1 do
  L12_1 = mp
  L12_1 = L12_1.ContextualExpandEnvironmentVariables
  L13_1 = L11_1
  L12_1 = L12_1(L13_1)
  L11_1 = L12_1
  L12_1 = string
  L12_1 = L12_1.len
  L13_1 = L11_1
  L12_1 = L12_1(L13_1)
  if L5_1 < L12_1 then
    L13_1 = L11_1
    L12_1 = L11_1.lower
    L12_1 = L12_1(L13_1)
    L13_1 = string
    L13_1 = L13_1.sub
    L14_1 = L12_1
    L15_1 = -L5_1
    L13_1 = L13_1(L14_1, L15_1)
    L14_1 = L4_1[L13_1]
    if L14_1 then
      L14_1 = false
      L15_1 = pairs
      L16_1 = L6_1
      L15_1, L16_1, L17_1 = L15_1(L16_1)
      for L18_1, L19_1 in L15_1, L16_1, L17_1 do
        L20_1 = string
        L20_1 = L20_1.find
        L21_1 = L12_1
        L22_1 = L19_1
        L23_1 = 1
        L24_1 = false
        L20_1 = L20_1(L21_1, L22_1, L23_1, L24_1)
        if L20_1 then
          L14_1 = true
          break
        end
      end
      if not L14_1 then
        L15_1 = sysio
        L15_1 = L15_1.IsFileExists
        L16_1 = L11_1
        L15_1 = L15_1(L16_1)
        if L15_1 then
          L15_1 = AppendToRollingQueue
          L16_1 = "ShellScripts"
          L17_1 = L0_1
          L18_1 = ",FilePath:"
          L19_1 = L11_1
          L17_1 = L17_1 .. L18_1 .. L19_1
          L18_1 = L11_1
          L19_1 = 3600
          L20_1 = 100
          L21_1 = 1
          L15_1(L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
          L15_1 = mp
          L15_1 = L15_1.ReportLowfi
          L16_1 = L11_1
          L17_1 = 4064046355
          L18_1 = {}
          L18_1.ReportingSig = "CMD:Trojan:Win32/WDAVTamper.C"
          L15_1(L16_1, L17_1, L18_1)
        end
      end
    end
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
