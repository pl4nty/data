local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = L0_1.ppid
if L1_1 ~= nil then
  L1_1 = L0_1.image_path
  if L1_1 ~= nil then
    L1_1 = L0_1.command_line
    if L1_1 ~= nil then
      L1_1 = string
      L1_1 = L1_1.lower
      L2_1 = L0_1.image_path
      L1_1 = L1_1(L2_1)
      L3_1 = L1_1
      L2_1 = L1_1.match
      L4_1 = "\\([^\\]+)$"
      L2_1 = L2_1(L3_1, L4_1)
      L3_1 = {}
      L3_1["cmd.exe"] = true
      L3_1["powershell.exe"] = true
      L3_1["pwsh.exe"] = true
      L3_1["cscript.exe"] = true
      L3_1["wscript.exe"] = true
      L3_1["mshta.exe"] = true
      L3_1["rundll.exe"] = true
      L3_1["regsvr32.exe"] = true
      L4_1 = L3_1[L2_1]
      if L4_1 then
        L4_1 = addRelatedProcess
        L4_1()
        L4_1 = bm_AddRelatedFileFromCommandLine
        L5_1 = L0_1.command_line
        L6_1 = nil
        L7_1 = nil
        L8_1 = 6
        L4_1(L5_1, L6_1, L7_1, L8_1)
      end
      L4_1 = AddResearchData
      L5_1 = L0_1.ppid
      L6_1 = true
      L4_1(L5_1, L6_1)
    end
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
