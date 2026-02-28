local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 == L1_1 then
  L0_1 = mp
  L0_1 = L0_1.get_contextdata
  L1_1 = mp
  L1_1 = L1_1.CONTEXT_DATA_NEWLYCREATEDHINT
  L0_1 = L0_1(L1_1)
  if L0_1 == true then
    L0_1 = mp
    L0_1 = L0_1.get_contextdata
    L1_1 = mp
    L1_1 = L1_1.CONTEXT_DATA_FILEPATH
    L0_1 = L0_1(L1_1)
    L1_1 = L0_1
    L0_1 = L0_1.lower
    L0_1 = L0_1(L1_1)
    L2_1 = L0_1
    L1_1 = L0_1.sub
    L3_1 = 1
    L4_1 = 8
    L1_1 = L1_1(L2_1, L3_1, L4_1)
    if L1_1 == "\\device\\" then
      L1_1 = MpCommon
      L1_1 = L1_1.PathToWin32Path
      L2_1 = L0_1
      L1_1 = L1_1(L2_1)
      L2_1 = L1_1
      L1_1 = L1_1.lower
      L1_1 = L1_1(L2_1)
      L0_1 = L1_1
    end
    if L0_1 == "c:" then
      L1_1 = mp
      L1_1 = L1_1.get_contextdata
      L2_1 = mp
      L2_1 = L2_1.CONTEXT_DATA_PROCESS_ID
      L1_1 = L1_1(L2_1)
      if L1_1 < 12 then
        L1_1 = mp
        L1_1 = L1_1.get_contextdata
        L2_1 = mp
        L2_1 = L2_1.CONTEXT_DATA_PROCESSNAME
        L1_1 = L1_1(L2_1)
        if "" == L1_1 then
          L1_1 = mp
          L1_1 = L1_1.getfilesize
          L1_1 = L1_1()
          if L1_1 < 1048576 then
            L1_1 = mp
            L1_1 = L1_1.set_mpattribute
            L2_1 = "Lua:ContextPECRoot.A1"
            L1_1(L2_1)
          end
          L1_1 = mp
          L1_1 = L1_1.INFECTED
          return L1_1
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
