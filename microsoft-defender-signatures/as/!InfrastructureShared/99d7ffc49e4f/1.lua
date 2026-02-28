local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = isnull
  L2_1 = L0_1.image_path
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    L1_1 = isnull
    L2_1 = L0_1.ppid
    L1_1 = L1_1(L2_1)
    if not L1_1 then
      L1_1 = string
      L1_1 = L1_1.lower
      L2_1 = L0_1.image_path
      L1_1 = L1_1(L2_1)
      L3_1 = L1_1
      L2_1 = L1_1.match
      L4_1 = "([^\\]+)$"
      L2_1 = L2_1(L3_1, L4_1)
      if L2_1 == "powershell.exe" or L2_1 == "cmd.exe" or L2_1 == "powershell_ise.exe" then
        L3_1 = string
        L3_1 = L3_1.lower
        L4_1 = mp
        L4_1 = L4_1.GetProcessCommandLine
        L5_1 = L0_1.ppid
        L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1)
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
        L4_1 = isnull
        L5_1 = L3_1
        L4_1 = L4_1(L5_1)
        if L4_1 then
          L4_1 = mp
          L4_1 = L4_1.CLEAN
          return L4_1
        end
        L4_1 = string
        L4_1 = L4_1.find
        L5_1 = L3_1
        L6_1 = ".ps1"
        L7_1 = 1
        L8_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if not L4_1 then
          L4_1 = string
          L4_1 = L4_1.find
          L5_1 = L3_1
          L6_1 = ".bat"
          L7_1 = 1
          L8_1 = true
          L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
          if not L4_1 then
            L4_1 = string
            L4_1 = L4_1.find
            L5_1 = L3_1
            L6_1 = ".cmd"
            L7_1 = 1
            L8_1 = true
            L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
            if not L4_1 then
              goto lbl_77
            end
          end
        end
        L4_1 = mp
        L4_1 = L4_1.CLEAN
        return L4_1
      end
      ::lbl_77::
      L3_1 = {}
      L3_1["cmd.exe"] = true
      L3_1["powershell.exe"] = true
      L3_1["powershell_ise.exe"] = true
      L3_1["explorer.exe"] = true
      L3_1["winrshost.exe"] = true
      L3_1["wsmprovhost.exe"] = true
      L3_1["rundll32.exe"] = true
      L3_1["wmiprvse.exe"] = true
      L4_1 = L3_1[L2_1]
      if L4_1 then
        L4_1 = mp
        L4_1 = L4_1.INFECTED
        return L4_1
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
