local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 204800 then
  L1_1 = mp
  L1_1 = L1_1.readprotection
  L2_1 = false
  L1_1(L2_1)
  L1_1 = tostring
  L2_1 = mp
  L2_1 = L2_1.readfile
  L3_1 = 0
  L4_1 = L0_1
  L2_1, L3_1, L4_1, L5_1, L6_1 = L2_1(L3_1, L4_1)
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "M%zi%zc%zr%zo%zs%zo%zf%zt%z %zE%zn%zh%za%zn%zc%ze%zd%z %zC%zr%zy%zp%zt%zo%zg%zr%za%zp%zh%zi%zc%z %zP%zr%zo%zv%zi%zd%ze%zr%z %zv%z1%z"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1
    L4_1 = "Macro di Excel 4.0"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 ~= nil then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L1_1
      L4_1 = "R%zo%zo%zt%z %zE%zn%zt%zr%zy%z"
      L2_1 = L2_1(L3_1, L4_1)
      if L2_1 ~= nil then
        L2_1 = string
        L2_1 = L2_1.find
        L3_1 = L1_1
        L4_1 = "S%zu%zm%zm%za%zr%zy%zI%zn%zf%zo%zr%zm%za%zt%zi%zo%zn"
        L2_1 = L2_1(L3_1, L4_1)
        if L2_1 ~= nil then
          L2_1 = string
          L2_1 = L2_1.find
          L3_1 = L1_1
          L4_1 = "D%zo%zc%zu%zm%ze%zn%zt%zS%zu%zm%zm%za%zr%zy%zI%zn%zf%zo%zr%zm%za%zt%zi%zo%zn"
          L2_1 = L2_1(L3_1, L4_1)
          if L2_1 ~= nil then
            L2_1 = string
            L2_1 = L2_1.find
            L3_1 = L1_1
            L4_1 = "Fogli di lavoro"
            L5_1 = 1
            L6_1 = true
            L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
            if L2_1 ~= nil then
              L2_1 = string
              L2_1 = L2_1.find
              L3_1 = L1_1
              L4_1 = "Sheet1"
              L5_1 = 1
              L6_1 = true
              L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
              if L2_1 ~= nil then
                L2_1 = string
                L2_1 = L2_1.find
                L3_1 = L1_1
                L4_1 = "Foglio2"
                L5_1 = 1
                L6_1 = true
                L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                if L2_1 ~= nil then
                  L2_1 = mp
                  L2_1 = L2_1.INFECTED
                  return L2_1
                end
              end
            end
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
