local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = Remediation
L0_1 = L0_1.Threat
L1_1 = L0_1.Active
if L1_1 then
  L1_1 = string
  L1_1 = L1_1.match
  L2_1 = L0_1.Name
  L3_1 = "Behavior:Win32/Rugmigen."
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 then
    L1_1 = GetRollingQueue
    L2_1 = "Rugmigen_Parent"
    L1_1 = L1_1(L2_1)
    if L1_1 ~= nil then
      L2_1 = type
      L3_1 = L1_1
      L2_1 = L2_1(L3_1)
      if L2_1 == "table" then
        L2_1 = pairs
        L3_1 = L1_1
        L2_1, L3_1, L4_1 = L2_1(L3_1)
        for L5_1 in L2_1, L3_1, L4_1 do
          L6_1 = tostring
          L7_1 = L1_1[L5_1]
          L7_1 = L7_1.key
          L6_1 = L6_1(L7_1)
          L7_1 = sysio
          L7_1 = L7_1.IsFileExists
          L8_1 = L6_1
          L7_1 = L7_1(L8_1)
          if L7_1 then
            L7_1 = sysio
            L7_1 = L7_1.DeleteFile
            L8_1 = L6_1
            L7_1(L8_1)
          end
        end
        L2_1 = pcall
        L3_1 = MpCommon
        L3_1 = L3_1.RollingQueueErase
        L4_1 = "Rugmigen_Parent"
        L2_1(L3_1, L4_1)
        L2_1 = "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Exclusions\\"
        L3_1 = sysio
        L3_1 = L3_1.RegOpenKey
        L4_1 = L2_1
        L5_1 = "Paths"
        L4_1 = L4_1 .. L5_1
        L3_1 = L3_1(L4_1)
        if L3_1 then
          L4_1 = {}
          L5_1 = "%appdata%"
          L6_1 = "%localappdata%"
          L7_1 = "%programdata%"
          L4_1[1] = L5_1
          L4_1[2] = L6_1
          L4_1[3] = L7_1
          L5_1 = GetPathsFromExpandFilePath
          L6_1 = L4_1
          L5_1 = L5_1(L6_1)
          L4_1 = L5_1
          L5_1 = DeleteRegistryEntriesOnValueMatch
          L6_1 = L3_1
          L7_1 = L4_1
          L8_1 = false
          L5_1(L6_1, L7_1, L8_1)
        end
      end
    end
  end
end
