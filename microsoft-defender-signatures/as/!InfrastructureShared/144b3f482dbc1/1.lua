local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L0_1 = L2_1.utf8p2
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[2]
      L0_1 = L2_1.utf8p2
    end
  end
end
L2_1 = {}
L3_1 = "python.exe"
L4_1 = "agentexecutor.exe"
L2_1[1] = L3_1
L2_1[2] = L4_1
L3_1 = bm
L3_1 = L3_1.get_process_relationships
L3_1, L4_1 = L3_1()
L5_1 = ipairs
L6_1 = L3_1
L5_1, L6_1, L7_1 = L5_1(L6_1)
for L8_1, L9_1 in L5_1, L6_1, L7_1 do
  L10_1 = L9_1.image_path
  if L10_1 ~= nil then
    L10_1 = mp
    L10_1 = L10_1.bitand
    L11_1 = L9_1.reason_ex
    L12_1 = 1
    L10_1 = L10_1(L11_1, L12_1)
    if L10_1 == 1 then
      L11_1 = contains
      L12_1 = L9_1.image_path
      L13_1 = L2_1
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
    end
  end
end
L5_1 = contains
L6_1 = L0_1
L7_1 = "%-[eE][ncodemaNCODEMA]*%s+"
L8_1 = false
L5_1 = L5_1(L6_1, L7_1, L8_1)
if L5_1 then
  L5_1 = NormalizeCmdline
  L6_1 = "powershell"
  L7_1 = L0_1
  L5_1 = L5_1(L6_1, L7_1)
  L1_1 = L5_1
  if L1_1 ~= nil then
    L5_1 = bm
    L5_1 = L5_1.add_related_string
    L6_1 = "proc_cmdline"
    L7_1 = L1_1
    L8_1 = bm
    L8_1 = L8_1.RelatedStringBMReport
    L5_1(L6_1, L7_1, L8_1)
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
