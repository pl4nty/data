local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = ""
L1_1 = tostring
L2_1 = footerpage
L1_1 = L1_1(L2_1)
L0_1 = L1_1
if L0_1 == nil or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = string
L1_1 = L1_1.match
L2_1 = L0_1
L3_1 = "%-replace%s+'([^']+)'"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.gsub
L3_1 = L0_1
L4_1 = L1_1
L5_1 = ""
L2_1 = L2_1(L3_1, L4_1, L5_1)
L0_1 = L2_1
L2_1 = string
L2_1 = L2_1.gsub
L3_1 = L0_1
L4_1 = " "
L5_1 = ""
L2_1 = L2_1(L3_1, L4_1, L5_1)
L0_1 = L2_1
L2_1 = string
L2_1 = L2_1.gsub
L3_1 = L0_1
L4_1 = "'%+'"
L5_1 = ""
L2_1 = L2_1(L3_1, L4_1, L5_1)
L0_1 = L2_1
L2_1 = string
L2_1 = L2_1.gsub
L3_1 = L0_1
L4_1 = "'"
L5_1 = ""
L2_1 = L2_1(L3_1, L4_1, L5_1)
L0_1 = L2_1
L2_1 = false
L3_1 = false
L4_1 = string
L4_1 = L4_1.find
L5_1 = L0_1
L6_1 = "iwr"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if not L4_1 then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L0_1
  L6_1 = "irm"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L0_1
    L6_1 = "invoke-webrequest"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 then
      L4_1 = string
      L4_1 = L4_1.find
      L5_1 = L0_1
      L6_1 = "invoke-restmethod"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if not L4_1 then
        L4_1 = string
        L4_1 = L4_1.find
        L5_1 = L0_1
        L6_1 = "iex"
        L7_1 = 1
        L8_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if not L4_1 then
          L4_1 = string
          L4_1 = L4_1.find
          L5_1 = L0_1
          L6_1 = "invoke-expression"
          L7_1 = 1
          L8_1 = true
          L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
          if not L4_1 then
            goto lbl_113
          end
        end
      end
    end
  end
end
L2_1 = true
::lbl_113::
L4_1 = string
L4_1 = L4_1.find
L5_1 = L0_1
L6_1 = "base64"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if not L4_1 then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L0_1
  L6_1 = "system.reflection.assembly"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    goto lbl_132
  end
end
L3_1 = true
::lbl_132::
if L2_1 and L3_1 then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
