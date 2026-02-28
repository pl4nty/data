local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L0_1 = L1_1.utf8p2
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L0_1 = L1_1.utf8p2
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[3]
      L0_1 = L1_1.utf8p2
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[4]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[4]
        L0_1 = L1_1.utf8p2
      end
    end
  end
end
L1_1 = contains
L2_1 = L0_1
L3_1 = {}
L4_1 = "AlexaNSISPlugin"
L5_1 = "Windows Photo Viewer\\PhotoViewer.dll"
L6_1 = "cryptextopencer"
L7_1 = "cryptextaddpfx"
L8_1 = "cryptext.dll"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = extractDllForRegproc
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = pcall
L3_1 = mp
L3_1 = L3_1.ContextualExpandEnvironmentVariables
L4_1 = L1_1
L2_1, L3_1 = L2_1(L3_1, L4_1)
if L2_1 and L3_1 then
  L4_1 = bm
  L4_1 = L4_1.add_related_file
  L5_1 = L3_1
  L4_1(L5_1)
  L4_1 = triggerMemoryScanOnProcessTree
  L5_1 = true
  L6_1 = true
  L7_1 = "SMS_M"
  L8_1 = 100
  L9_1 = "Behavior:Win32/DllInject.SD"
  L4_1(L5_1, L6_1, L7_1, L8_1, L9_1)
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
