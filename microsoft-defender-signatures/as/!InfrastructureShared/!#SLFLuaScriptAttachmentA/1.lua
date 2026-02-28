local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Lua:FileInOutlookCache.A"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "Lua:FileInWindowsMailApp.A"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    goto lbl_52
  end
end
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_FILENAME
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L1_1(L2_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
L1_1 = {}
L1_1.vbs = true
L1_1.ps1 = true
L1_1[".js"] = true
L1_1.jse = true
L1_1.vbe = true
L2_1 = string
L2_1 = L2_1.sub
L3_1 = L0_1
L4_1 = -3
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= nil then
  L3_1 = L1_1[L2_1]
  if L3_1 == true then
    L3_1 = mp
    L3_1 = L3_1.get_contextdata
    L4_1 = mp
    L4_1 = L4_1.CONTEXT_DATA_PROCESS_ID
    L3_1 = L3_1(L4_1)
    if L3_1 then
      L4_1 = TrackPidAndTechnique
      L5_1 = L3_1
      L6_1 = "T1566.001 "
      L7_1 = "phishingattachment"
      L4_1(L5_1, L6_1, L7_1)
    end
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
::lbl_52::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
