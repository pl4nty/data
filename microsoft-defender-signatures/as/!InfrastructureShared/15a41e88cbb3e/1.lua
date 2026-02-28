local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L2_1 = 0
L3_1 = "RcloneMega"
L4_1 = {}
L5_1 = 3600
L6_1 = 100
L7_1 = "|"
L8_1 = this_sigattrlog
L8_1 = L8_1[3]
L8_1 = L8_1.matched
if L8_1 then
  L8_1 = this_sigattrlog
  L8_1 = L8_1[3]
  L8_1 = L8_1.utf8p1
  if L8_1 ~= nil then
    L8_1 = this_sigattrlog
    L8_1 = L8_1[3]
    L8_1 = L8_1.utf8p2
    if L8_1 ~= nil then
      L8_1 = this_sigattrlog
      L8_1 = L8_1[3]
      L0_1 = L8_1.utf8p1
      L8_1 = this_sigattrlog
      L8_1 = L8_1[3]
      L1_1 = L8_1.utf8p2
    end
  end
end
L8_1 = this_sigattrlog
L8_1 = L8_1[6]
L8_1 = L8_1.matched
if L8_1 then
  L8_1 = this_sigattrlog
  L8_1 = L8_1[6]
  L8_1 = L8_1.utf8p2
  if L8_1 ~= nil then
    L8_1 = tonumber
    L9_1 = this_sigattrlog
    L9_1 = L9_1[6]
    L9_1 = L9_1.utf8p2
    L8_1 = L8_1(L9_1)
    L2_1 = L8_1
  end
end
L8_1 = L0_1
L9_1 = L7_1
L10_1 = L1_1
L8_1 = L8_1 .. L9_1 .. L10_1
L9_1 = L8_1
L10_1 = "count"
L9_1 = L9_1 .. L10_1
L10_1 = 1
L11_1 = MpCommon
L11_1 = L11_1.AtomicCounterValue
L12_1 = L8_1
L11_1 = L11_1(L12_1)
if L11_1 == nil then
  L12_1 = MpCommon
  L12_1 = L12_1.AtomicCounterSet
  L13_1 = L8_1
  L14_1 = L2_1
  L15_1 = 600
  L12_1(L13_1, L14_1, L15_1)
  L12_1 = MpCommon
  L12_1 = L12_1.AtomicCounterSet
  L13_1 = L9_1
  L14_1 = L10_1
  L15_1 = 600
  L12_1(L13_1, L14_1, L15_1)
else
  L12_1 = MpCommon
  L12_1 = L12_1.AtomicCounterAdd
  L13_1 = L8_1
  L14_1 = L2_1
  L12_1 = L12_1(L13_1, L14_1)
  L11_1 = L12_1 + L2_1
  L12_1 = MpCommon
  L12_1 = L12_1.AtomicCounterAdd
  L13_1 = L9_1
  L14_1 = L10_1
  L12_1 = L12_1(L13_1, L14_1)
  L10_1 = L12_1 + 1
  if 75000000 < L11_1 and 10 < L10_1 then
    L4_1.ContentLen = L11_1
    L4_1.Threshold = L10_1
    L4_1.ProcPath = L0_1
    L12_1 = AppendToRollingQueue
    L13_1 = L3_1
    L14_1 = L8_1
    L15_1 = L4_1
    L16_1 = L5_1
    L17_1 = L6_1
    L18_1 = 0
    L12_1(L13_1, L14_1, L15_1, L16_1, L17_1, L18_1)
    L12_1 = mp
    L12_1 = L12_1.INFECTED
    return L12_1
  end
end
L12_1 = mp
L12_1 = L12_1.CLEAN
return L12_1
