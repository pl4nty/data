local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 ~= L1_1 then
    goto lbl_92
  end
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_FILENAME
L2_1, L3_1, L4_1, L5_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
L2_1 = mp
L2_1 = L2_1.getfilesize
L2_1 = L2_1()
if L2_1 == 81 then
  L2_1 = string
  L2_1 = L2_1.sub
  L3_1 = L1_1
  L4_1 = -3
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 == ".ph" then
    L2_1 = mp
    L2_1 = L2_1.set_mpattribute
    L3_1 = "Lua:SefnitConfig2"
    L2_1(L3_1)
end
else
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = mp
  L3_1 = L3_1.get_contextdata
  L4_1 = mp
  L4_1 = L4_1.CONTEXT_DATA_FILEPATH
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L2_1
  L5_1 = -27
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 ~= "\\application policy service" then
    L3_1 = string
    L3_1 = L3_1.sub
    L4_1 = L2_1
    L5_1 = -30
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 ~= "\\windows internet name service" then
      goto lbl_79
    end
  end
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L1_1
  L5_1 = -4
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 ~= ".exe" then
    L3_1 = string
    L3_1 = L3_1.sub
    L4_1 = L1_1
    L5_1 = -4
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 ~= ".dll" then
      goto lbl_79
    end
  end
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lowfi:Lua:SefnitFilenameTorComponent"
  L3_1(L4_1)
  ::lbl_79::
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L2_1
  L5_1 = -5
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 == "\\dfrg" and L1_1 == "runner.exe" then
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "Lowfi:Lua:TrojanSefnitBitcoinMining"
    L3_1(L4_1)
  end
end
::lbl_92::
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if L1_1 == 81 then
  L1_1 = headerpage
  L1_1 = L1_1[2]
  if L1_1 == 42 then
    L1_1 = headerpage
    L1_1 = L1_1[3]
    if L1_1 == 26 then
      L1_1 = headerpage
      L1_1 = L1_1[4]
      if L1_1 == 175 then
        L1_1 = headerpage
        L1_1 = L1_1[5]
        if L1_1 == 220 then
          goto lbl_129
        end
      end
    end
  end
  L1_1 = headerpage
  L1_1 = L1_1[2]
  if L1_1 == 225 then
    L1_1 = headerpage
    L1_1 = L1_1[3]
    if L1_1 == 58 then
      L1_1 = headerpage
      L1_1 = L1_1[4]
      if L1_1 == 192 then
        L1_1 = headerpage
        L1_1 = L1_1[5]
        ::lbl_129::
        if L1_1 == 106 then
          L1_1 = mp
          L1_1 = L1_1.crc32
          L2_1 = 0
          L3_1 = headerpage
          L4_1 = 2
          L5_1 = 64
          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
          if L1_1 == 1980615234 then
            L2_1 = mp
            L2_1 = L2_1.INFECTED
            return L2_1
          elseif L1_1 == 2557802102 then
            L2_1 = mp
            L2_1 = L2_1.INFECTED
            return L2_1
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
