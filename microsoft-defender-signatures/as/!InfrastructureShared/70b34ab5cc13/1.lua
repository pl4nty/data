local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.command_line
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = L0_1.command_line
    L1_1 = L1_1(L2_1)
    L3_1 = L1_1
    L2_1 = L1_1.match
    L4_1 = "maxsize=([0-9%.]*)%%"
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 ~= nil then
      L3_1 = tonumber
      L4_1 = L2_1
      L3_1 = L3_1(L4_1)
      L2_1 = L3_1
      if 4 < L2_1 then
        L3_1 = mp
        L3_1 = L3_1.CLEAN
        return L3_1
      end
    end
    L4_1 = L1_1
    L3_1 = L1_1.match
    L5_1 = "maxsize=([0-9%.]*)gb"
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 ~= nil then
      L4_1 = tonumber
      L5_1 = L3_1
      L4_1 = L4_1(L5_1)
      L3_1 = L4_1
      if 1 < L3_1 then
        L4_1 = mp
        L4_1 = L4_1.CLEAN
        return L4_1
      end
    end
    L5_1 = L1_1
    L4_1 = L1_1.match
    L6_1 = "maxsize=([0-9%.]*)mb"
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 ~= nil then
      L5_1 = tonumber
      L6_1 = L4_1
      L5_1 = L5_1(L6_1)
      L4_1 = L5_1
      if 1000 < L4_1 then
        L5_1 = mp
        L5_1 = L5_1.CLEAN
        return L5_1
      end
    end
    L6_1 = L1_1
    L5_1 = L1_1.match
    L7_1 = "maxsize=unbounded"
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
    L5_1 = AddResearchData
    L6_1 = L0_1.ppid
    L7_1 = true
    L5_1(L6_1, L7_1)
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
