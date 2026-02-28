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
    L1_1 = nil
    if L0_1 ~= nil then
      L2_1 = sysio
      L2_1 = L2_1.IsFileExists
      L3_1 = L0_1
      L2_1 = L2_1(L3_1)
      if L2_1 then
        L2_1 = sysio
        L2_1 = L2_1.GetFileSize
        L3_1 = L0_1
        L2_1 = L2_1(L3_1)
        L1_1 = L2_1
        if L1_1 ~= nil and 30000 < L1_1 and L1_1 < 40000 then
          L2_1 = sms_untrusted_process
          L2_1()
          L2_1 = mp
          L2_1 = L2_1.INFECTED
          return L2_1
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
