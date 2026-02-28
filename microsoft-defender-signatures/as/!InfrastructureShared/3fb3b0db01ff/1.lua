local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = L0_1.command_line
if L1_1 then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = ".msi"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "http://"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if not L2_1 then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1
    L4_1 = "https://"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if not L2_1 then
      goto lbl_103
    end
  end
  L2_1 = string
  L2_1 = L2_1.gsub
  L3_1 = L1_1
  L4_1 = "\t"
  L5_1 = ""
  L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1)
  L4_1 = string
  L4_1 = L4_1.gsub
  L5_1 = L1_1
  L6_1 = "="
  L7_1 = ""
  L4_1, L5_1 = L4_1(L5_1, L6_1, L7_1)
  L6_1 = string
  L6_1 = L6_1.gsub
  L7_1 = L1_1
  L8_1 = " "
  L9_1 = ""
  L6_1, L7_1 = L6_1(L7_1, L8_1, L9_1)
  L8_1 = string
  L8_1 = L8_1.gsub
  L9_1 = L1_1
  L10_1 = " %w+=%w+"
  L11_1 = ""
  L8_1, L9_1 = L8_1(L9_1, L10_1, L11_1)
  if 10 <= L3_1 and 1 <= L5_1 then
    L10_1 = mp
    L10_1 = L10_1.INFECTED
    return L10_1
  end
  L10_1 = string
  L10_1 = L10_1.find
  L11_1 = L1_1
  L12_1 = " -q"
  L13_1 = 1
  L14_1 = true
  L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
  if not L10_1 then
    L10_1 = string
    L10_1 = L10_1.find
    L11_1 = L1_1
    L12_1 = " /q"
    L13_1 = 1
    L14_1 = true
    L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
    if not L10_1 then
      goto lbl_103
    end
  end
  if 20 <= L7_1 and 4 <= L5_1 then
    L10_1 = mp
    L10_1 = L10_1.INFECTED
    return L10_1
  end
  if 4 <= L9_1 then
    L10_1 = mp
    L10_1 = L10_1.INFECTED
    return L10_1
  end
end
::lbl_103::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
