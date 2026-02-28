local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.readprotection
L1_1 = false
L0_1(L1_1)
L0_1 = tostring
L1_1 = mp
L1_1 = L1_1.readfile
L2_1 = 512
L3_1 = 512
L1_1, L2_1, L3_1, L4_1, L5_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "M%zi%zc%zr%zo%zs%zo%zf%zt%z %zE%zn%zh%za%zn%zc%ze%zd%z %zC%zr%zy%zp%zt%zo%zg%zr%za%zp%zh%zi%zc%z %zP%zr%zo%zv%zi%zd%ze%zr%z %zv%z1%z"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= nil then
  L1_1 = tostring
  L2_1 = mp
  L2_1 = L2_1.readfile
  L3_1 = 34048
  L4_1 = 1280
  L2_1, L3_1, L4_1, L5_1 = L2_1(L3_1, L4_1)
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "Excel 4.0 Macros"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 ~= nil then
    L2_1 = tostring
    L3_1 = mp
    L3_1 = L3_1.readfile
    L4_1 = 38288
    L5_1 = 1536
    L3_1, L4_1, L5_1 = L3_1(L4_1, L5_1)
    L2_1 = L2_1(L3_1, L4_1, L5_1)
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L2_1
    L5_1 = "R%zo%zo%zt%z %zE%zn%zt%zr%zy%z"
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 ~= nil then
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
