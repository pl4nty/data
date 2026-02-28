local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = L0_1.command_line
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1 = L2_1()
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = IsExcludedByCmdlineMacOS
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = IsExcludedByImagePathMacOS
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    goto lbl_28
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_28::
L3_1 = nil
L4_1 = this_sigattrlog
L4_1 = L4_1[1]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[1]
  L4_1 = L4_1.utf8p2
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[1]
    L4_1 = L4_1.utf8p2
    if L4_1 ~= "" then
      L4_1 = string
      L4_1 = L4_1.lower
      L5_1 = this_sigattrlog
      L5_1 = L5_1[1]
      L5_1 = L5_1.utf8p2
      L4_1 = L4_1(L5_1)
      L3_1 = L4_1
  end
end
else
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = 0
L5_1 = nil
L6_1 = this_sigattrlog
L6_1 = L6_1[3]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = this_sigattrlog
  L6_1 = L6_1[3]
  L6_1 = L6_1.utf8p1
  if L6_1 ~= nil then
    L6_1 = this_sigattrlog
    L6_1 = L6_1[3]
    L6_1 = L6_1.np2
    if L6_1 ~= nil then
      L6_1 = this_sigattrlog
      L6_1 = L6_1[3]
      L5_1 = L6_1.utf8p1
      L6_1 = this_sigattrlog
      L6_1 = L6_1[3]
      L4_1 = L6_1.np2
    end
  end
end
L7_1 = L5_1
L6_1 = L5_1.match
L8_1 = "([^/]+)$"
L6_1 = L6_1(L7_1, L8_1)
L7_1 = tonumber
L8_1 = tostring
L9_1 = L4_1
L8_1 = L8_1(L9_1)
L9_1 = 8
L7_1 = L7_1(L8_1, L9_1)
L8_1 = mp
L8_1 = L8_1.bsplit
L9_1 = L7_1
L10_1 = 3
L8_1, L9_1, L10_1, L11_1 = L8_1(L9_1, L10_1)
if L8_1 == 0 and L9_1 == 0 and L10_1 == 0 and L11_1 == 0 then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L12_1 = string
L12_1 = L12_1.find
L13_1 = L3_1
L14_1 = string
L14_1 = L14_1.lower
L15_1 = L6_1
L14_1 = L14_1(L15_1)
L15_1 = 1
L16_1 = true
L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
if not L12_1 then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L12_1 = string
L12_1 = L12_1.find
L13_1 = L3_1
L14_1 = "http"
L15_1 = 1
L16_1 = true
L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
if L12_1 then
  L12_1 = mp
  L12_1 = L12_1.bitand
  L13_1 = L8_1
  L14_1 = 1
  L12_1 = L12_1(L13_1, L14_1)
  if L12_1 ~= 1 then
    L12_1 = mp
    L12_1 = L12_1.bitand
    L13_1 = L9_1
    L14_1 = 1
    L12_1 = L12_1(L13_1, L14_1)
    if L12_1 ~= 1 then
      L12_1 = mp
      L12_1 = L12_1.bitand
      L13_1 = L10_1
      L14_1 = 1
      L12_1 = L12_1(L13_1, L14_1)
      if L12_1 ~= 1 then
        goto lbl_160
      end
    end
  end
  if L5_1 ~= "" and L5_1 ~= nil then
    L12_1 = bm
    L12_1 = L12_1.trigger_sig
    L13_1 = "UnsignedFileDownloadExecuted"
    L14_1 = L5_1
    L12_1(L13_1, L14_1)
  end
  L12_1 = mp
  L12_1 = L12_1.INFECTED
  return L12_1
end
::lbl_160::
L12_1 = mp
L12_1 = L12_1.CLEAN
return L12_1
