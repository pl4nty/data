local L0_1, L1_1, L2_1, L3_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L0_1 = L1_1.utf8p1
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = L0_1
    L2_1 = L2_1(L3_1)
    L3_1 = "d0nut.html"
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 ~= nil then
      L1_1 = extractRansomNote
      L2_1 = L0_1
      L1_1(L2_1)
      L1_1 = sms_untrusted_process
      L1_1()
      L1_1 = mp
      L1_1 = L1_1.INFECTED
      return L1_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
