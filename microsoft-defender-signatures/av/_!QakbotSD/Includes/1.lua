local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.GetLnkInfo
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.BasePath
if L1_1 then
  L1_1 = contains
  L2_1 = L0_1.BasePath
  L3_1 = "cmd.exe"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 then
    L1_1 = L0_1.Arguments
    if not L1_1 then
      L1_1 = nil
    end
    if L1_1 == nil then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L3_1 = L1_1
    L2_1 = L1_1.gsub
    L4_1 = "&&"
    L5_1 = ""
    L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1)
    if 3 < L3_1 then
      L4_1 = contains
      L5_1 = L1_1
      L6_1 = "curl%.?e?x?e?%s+.*https?.*wscript%.?e?x?e?"
      L7_1 = false
      L4_1 = L4_1(L5_1, L6_1, L7_1)
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
