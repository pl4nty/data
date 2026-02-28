local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 == L1_1 then
  L0_1 = mp
  L0_1 = L0_1.bitand
  L1_1 = mp
  L1_1 = L1_1.get_contextdata
  L2_1 = mp
  L2_1 = L2_1.CONTEXT_DATA_DEVICE_CHARACTERISTICS
  L1_1 = L1_1(L2_1)
  L2_1 = 264193
  L0_1 = L0_1(L1_1, L2_1)
  if L0_1 == 264193 then
    goto lbl_48
  end
  L0_1 = mp
  L0_1 = L0_1.bitand
  L1_1 = mp
  L1_1 = L1_1.get_contextdata
  L2_1 = mp
  L2_1 = L2_1.CONTEXT_DATA_DEVICE_CHARACTERISTICS
  L1_1 = L1_1(L2_1)
  L2_1 = 16
  L0_1 = L0_1(L1_1, L2_1)
  if L0_1 == 16 then
    goto lbl_48
  end
end
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
  ::lbl_48::
  if L0_1 == true then
    L0_1 = mp
    L0_1 = L0_1.get_contextdata
    L1_1 = mp
    L1_1 = L1_1.CONTEXT_DATA_FILENAME
    L0_1 = L0_1(L1_1)
    if nil == L0_1 then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
    L1_1 = {}
    L1_1[".hta"] = true
    L1_1[".js"] = true
    L1_1[".jse"] = true
    L1_1[".ps1"] = true
    L1_1[".vbs"] = true
    L1_1[".vbe"] = true
    L1_1[".wsh"] = true
    L3_1 = L0_1
    L2_1 = L0_1.sub
    L4_1 = -5
    L2_1 = L2_1(L3_1, L4_1)
    L3_1 = L2_1
    L2_1 = L2_1.match
    L4_1 = "(%.%w+)$"
    L2_1 = L2_1(L3_1, L4_1)
    if nil == L2_1 then
      L3_1 = ""
      if L3_1 then
        goto lbl_80
        L2_1 = L3_1 or L2_1
      end
    end
    L4_1 = L2_1
    L3_1 = L2_1.lower
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
    ::lbl_80::
    L3_1 = L1_1[L2_1]
    if true == L3_1 then
      L3_1 = mp
      L3_1 = L3_1.set_mpattribute
      L4_1 = "Lua:CloudLowfiForE5!"
      L6_1 = L2_1
      L5_1 = L2_1.sub
      L7_1 = 2
      L5_1 = L5_1(L6_1, L7_1)
      L4_1 = L4_1 .. L5_1
      L3_1(L4_1)
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
