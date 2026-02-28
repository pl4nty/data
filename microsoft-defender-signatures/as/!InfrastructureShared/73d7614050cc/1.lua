local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "RPF:CmdLineMLv2:100"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "RPF:CmdLineMLv2:130"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.get_mpattribute
    L1_1 = "RPF:CmdLineMLv2:150"
    L0_1 = L0_1(L1_1)
    if not L0_1 then
      goto lbl_85
    end
  end
end
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = L0_1.image_path
  L1_1 = L1_1(L2_1)
  if L1_1 ~= nil then
    L3_1 = L1_1
    L2_1 = L1_1.match
    L4_1 = "([^\\]+)$"
    L2_1 = L2_1(L3_1, L4_1)
    L3_1 = {}
    L3_1["mshta.exe"] = true
    L3_1["cmd.exe"] = true
    L3_1["wscript.exe"] = true
    L3_1["powershell.exe"] = true
    L3_1["explorer.exe"] = true
    L3_1["conhost.exe"] = true
    L3_1["pwsh.exe"] = true
    L4_1 = {}
    L4_1["winrshost.exe"] = true
    L5_1 = L3_1[L2_1]
    if not L5_1 then
      L5_1 = mp
      L5_1 = L5_1.IsKnownFriendlyFile
      L6_1 = L1_1
      L7_1 = true
      L8_1 = false
      L5_1 = L5_1(L6_1, L7_1, L8_1)
      if L5_1 == true then
        goto lbl_85
      end
    end
    L5_1 = mp
    L5_1 = L5_1.GetParentProcInfo
    L6_1 = L0_1.ppid
    L5_1 = L5_1(L6_1)
    L6_1 = isnull
    L7_1 = L5_1
    L6_1 = L6_1(L7_1)
    if not L6_1 then
      L6_1 = isnull
      L7_1 = L5_1.image_path
      L6_1 = L6_1(L7_1)
      if not L6_1 then
        L6_1 = string
        L6_1 = L6_1.lower
        L7_1 = L5_1.image_path
        L6_1 = L6_1(L7_1)
        L8_1 = L6_1
        L7_1 = L6_1.match
        L9_1 = "([^\\]+)$"
        L7_1 = L7_1(L8_1, L9_1)
        L8_1 = L4_1[L7_1]
        if L8_1 then
          L8_1 = mp
          L8_1 = L8_1.CLEAN
          return L8_1
        else
          L8_1 = mp
          L8_1 = L8_1.INFECTED
          return L8_1
        end
      end
    end
  end
end
::lbl_85::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
