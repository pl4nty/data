local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = {}
L2_1 = 1
L3_1 = L0_1
L4_1 = 1
for L5_1 = L2_1, L3_1, L4_1 do
  L6_1 = sigattr_tail
  L6_1 = L6_1[L5_1]
  L6_1 = L6_1.attribute
  if L6_1 ~= 16384 then
    L6_1 = sigattr_tail
    L6_1 = L6_1[L5_1]
    L6_1 = L6_1.attribute
    if L6_1 ~= 16385 then
      L6_1 = sigattr_tail
      L6_1 = L6_1[L5_1]
      L6_1 = L6_1.attribute
      if L6_1 ~= 16386 then
        goto lbl_36
      end
    end
  end
  L6_1 = sigattr_tail
  L6_1 = L6_1[L5_1]
  L6_1 = L6_1.utf8p1
  L7_1 = L6_1
  L6_1 = L6_1.lower
  L6_1 = L6_1(L7_1)
  L7_1 = mp
  L7_1 = L7_1.crc32
  L8_1 = 0
  L9_1 = L6_1
  L10_1 = 1
  L11_1 = #L6_1
  L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
  L1_1[L7_1] = 1
  ::lbl_36::
end
L2_1 = 0
L3_1 = 1
L4_1 = L0_1
L5_1 = 1
for L6_1 = L3_1, L4_1, L5_1 do
  L7_1 = sigattr_tail
  L7_1 = L7_1[L6_1]
  L7_1 = L7_1.attribute
  if L7_1 == 16389 then
    L7_1 = sigattr_tail
    L7_1 = L7_1[L6_1]
    L7_1 = L7_1.utf8p2
    if L7_1 == "ATTR_a280babb" then
      L7_1 = sigattr_tail
      L7_1 = L7_1[L6_1]
      L7_1 = L7_1.utf8p1
      if L7_1 ~= nil then
        L7_1 = sigattr_tail
        L7_1 = L7_1[L6_1]
        L7_1 = L7_1.utf8p1
        L8_1 = L7_1
        L7_1 = L7_1.lower
        L7_1 = L7_1(L8_1)
        L8_1 = mp
        L8_1 = L8_1.crc32
        L9_1 = 0
        L10_1 = L7_1
        L11_1 = 1
        L12_1 = #L7_1
        L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
        L9_1 = L1_1[L8_1]
        if L9_1 == 1 then
          L2_1 = L2_1 + 1
        end
      end
    end
  end
end
if 5 < L2_1 then
  L3_1 = sms_untrusted_process
  L3_1()
  L3_1 = reportTimingData
  L3_1()
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
