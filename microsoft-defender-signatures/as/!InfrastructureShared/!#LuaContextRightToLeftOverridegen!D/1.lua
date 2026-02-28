local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_FILENAME
L1_1, L2_1, L3_1, L4_1, L5_1 = L1_1(L2_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if 5 < L1_1 then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "\226\128\174"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if L1_1 == nil then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
    L1_1 = string
    L1_1 = L1_1.sub
    L2_1 = L0_1
    L3_1 = -7
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 ~= nil then
      L2_1 = #L1_1
      if not (L2_1 < 1) then
        goto lbl_39
      end
    end
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    do return L2_1 end
    ::lbl_39::
    L2_1 = {}
    L2_1["\226\128\174.bat"] = "Lua:Context/RightToLeftOverride.DA"
    L2_1["\226\128\174.cmd"] = "Lua:Context/RightToLeftOverride.DA"
    L2_1["\226\128\174.lnk"] = "Lua:Context/RightToLeftOverride.DA"
    L2_1["\226\128\174.ps1"] = "Lua:Context/RightToLeftOverride.DA"
    L2_1["\226\128\174.vbe"] = "Lua:Context/RightToLeftOverride.DB"
    L2_1["\226\128\174.vbs"] = "Lua:Context/RightToLeftOverride.DB"
    L2_1["\226\128\174.js"] = "Lua:Context/RightToLeftOverride.DB"
    L2_1["\226\128\174.jse"] = "Lua:Context/RightToLeftOverride.DB"
    L2_1["\226\128\174.wsh"] = "Lua:Context/RightToLeftOverride.DB"
    L2_1["\226\128\174.wsf"] = "Lua:Context/RightToLeftOverride.DB"
    L2_1["\226\128\174.hta"] = "Lua:Context/RightToLeftOverride.DB"
    L2_1["\226\128\174.jar"] = "Lua:Context/RightToLeftOverride.DC"
    L2_1["\226\128\174.com"] = "Lua:Context/RightToLeftOverride.DD"
    L2_1["\226\128\174.exe"] = "Lua:Context/RightToLeftOverride.DD"
    L2_1["\226\128\174.scr"] = "Lua:Context/RightToLeftOverride.DD"
    L2_1["\226\128\174.pif"] = "Lua:Context/RightToLeftOverride.DD"
    L3_1 = L2_1[L1_1]
    if L3_1 == nil then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = mp
    L4_1 = L4_1.set_mpattribute
    L5_1 = L3_1
    L4_1(L5_1)
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
