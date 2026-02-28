local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 == L1_1 then
  L0_1 = mp
  L0_1 = L0_1.get_contextdata
  L1_1 = mp
  L1_1 = L1_1.CONTEXT_DATA_HAS_MOTW_ADS
  L0_1 = L0_1(L1_1)
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.GetMOTWHostUrl
    L0_1 = L0_1()
    if L0_1 ~= nil then
      L1_1 = string
      L1_1 = L1_1.len
      L2_1 = L0_1
      L1_1 = L1_1(L2_1)
      if 50 < L1_1 then
        L2_1 = L0_1
        L1_1 = L0_1.find
        L3_1 = "https://green.info/chatting/"
        L4_1 = 1
        L5_1 = true
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if not L1_1 then
          L2_1 = L0_1
          L1_1 = L0_1.find
          L3_1 = ".v8.pro/chat/"
          L4_1 = 1
          L5_1 = true
          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
          if not L1_1 then
            L2_1 = L0_1
            L1_1 = L0_1.find
            L3_1 = ".v8.pro/attach/"
            L4_1 = 1
            L5_1 = true
            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
            if not L1_1 then
              goto lbl_56
            end
          end
        end
        L1_1 = mp
        L1_1 = L1_1.set_mpattribute
        L2_1 = "//Lua:JugrottoChild"
        L1_1(L2_1)
        L1_1 = mp
        L1_1 = L1_1.INFECTED
        return L1_1
      end
    end
  end
end
::lbl_56::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
