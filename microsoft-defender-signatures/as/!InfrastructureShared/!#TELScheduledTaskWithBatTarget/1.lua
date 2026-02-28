local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
L2_1 = L0_1
L1_1 = L0_1.match
L3_1 = "(.+\\)([^\\]+)$"
L1_1, L2_1 = L1_1(L2_1, L3_1)
L4_1 = L1_1
L3_1 = L1_1.len
L3_1 = L3_1(L4_1)
if 8 < L3_1 then
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L1_1
  L5_1 = -7
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 == "\\tasks\\" then
    L3_1 = mp
    L3_1 = L3_1.HEADERPAGE_SZ
    if L3_1 <= 4096 then
      L3_1 = tostring
      L4_1 = headerpage
      L3_1 = L3_1(L4_1)
      L5_1 = L3_1
      L4_1 = L3_1.match
      L6_1 = "<Exec>.+<Command>(.+)</Command>"
      L4_1 = L4_1(L5_1, L6_1)
      if L4_1 ~= nil then
        L6_1 = L4_1
        L5_1 = L4_1.len
        L5_1 = L5_1(L6_1)
        if 5 < L5_1 then
          L5_1 = string
          L5_1 = L5_1.sub
          L6_1 = L4_1
          L7_1 = -4
          L5_1 = L5_1(L6_1, L7_1)
          if L5_1 == ".bat" then
            L5_1 = mp
            L5_1 = L5_1.ReportLowfi
            L6_1 = L4_1
            L7_1 = 203848782
            L5_1(L6_1, L7_1)
          end
        end
      end
    end
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
