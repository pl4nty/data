local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 == nil or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.command_line
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1 = L2_1()
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
if L3_1 == "" or L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = "ioreg -k ioplatformserialnumber | grep ioplatformserialnumber | cut -w -f5 | xargs"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1
  L6_1 = "whoami"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L3_1
    L6_1 = "serialnumber"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if L4_1 then
      L4_1 = string
      L4_1 = L4_1.find
      L5_1 = L3_1
      L6_1 = "modulename"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if L4_1 then
        L4_1 = string
        L4_1 = L4_1.find
        L5_1 = L3_1
        L6_1 = "curl -fksl "
        L7_1 = 1
        L8_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if L4_1 then
          L4_1 = mp
          L4_1 = L4_1.INFECTED
          return L4_1
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
