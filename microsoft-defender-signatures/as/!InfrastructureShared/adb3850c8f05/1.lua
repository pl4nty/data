local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = ""
L1_1 = ""
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
    L1_1 = "regasm.exe"
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
      L1_1 = "regsvcs.exe"
    end
  end
end
L2_1 = pcall
L3_1 = MpCommon
L3_1 = L3_1.CommandLineToArgv
L4_1 = L0_1
L2_1, L3_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L4_1 = isnull
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  if not L4_1 then
    L4_1 = type
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    if L4_1 == "table" then
      L4_1 = isnull
      L5_1 = #L3_1
      L4_1 = L4_1(L5_1)
      if not L4_1 then
        goto lbl_57
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_57::
L4_1 = #L3_1
if L4_1 == 1 then
  L4_1 = L3_1[1]
  if L4_1 ~= nil then
    goto lbl_66
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_66::
L4_1 = StringEndsWith
L5_1 = string
L5_1 = L5_1.lower
L6_1 = L3_1[1]
L5_1 = L5_1(L6_1)
L6_1 = L1_1
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = sms_untrusted_process
  L4_1()
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
