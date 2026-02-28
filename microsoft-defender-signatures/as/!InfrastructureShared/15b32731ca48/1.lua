local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.command_line
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "rundll32"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 ~= nil and L1_1 ~= nil then
    L2_1 = extractDllForRegproc
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    if L2_1 then
      L3_1 = checkFileLastWriteTime
      L4_1 = L2_1
      L5_1 = 600
      L3_1 = L3_1(L4_1, L5_1)
      if L3_1 == false then
        L3_1 = mp
        L3_1 = L3_1.IsKnownFriendlyFile
        L4_1 = L2_1
        L5_1 = true
        L6_1 = false
        L3_1 = L3_1(L4_1, L5_1, L6_1)
        if L3_1 == false then
          L3_1 = bm
          L3_1 = L3_1.add_threat_file
          L4_1 = L2_1
          L3_1(L4_1)
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
