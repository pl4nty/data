local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 == L1_1 then
  L1_1 = mp
  L1_1 = L1_1.get_contextdata
  L2_1 = mp
  L2_1 = L2_1.CONTEXT_DATA_NEWLYCREATEDHINT
  L1_1 = L1_1(L2_1)
  if L1_1 == true then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = mp
    L2_1 = L2_1.get_contextdata
    L3_1 = mp
    L3_1 = L3_1.CONTEXT_DATA_FILENAME
    L2_1, L3_1, L4_1, L5_1 = L2_1(L3_1)
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    L3_1 = L1_1
    L2_1 = L1_1.find
    L4_1 = "win10%w+%."
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 ~= nil then
      L2_1 = {}
      L2_1[".cpl"] = ""
      L2_1[".exe"] = ""
      L2_1[".scr"] = ""
      L2_1[".pif"] = ""
      L2_1[".zip"] = ""
      L2_1[".rar"] = ""
      L2_1[".vbs"] = ""
      L2_1[".vbe"] = ""
      L2_1[".jse"] = ""
      L3_1 = string
      L3_1 = L3_1.sub
      L4_1 = L1_1
      L5_1 = -4
      L3_1 = L3_1(L4_1, L5_1)
      L3_1 = L2_1[L3_1]
      if L3_1 then
        L3_1 = isOutlookProcess
        L3_1 = L3_1()
        if L3_1 then
          L3_1 = mp
          L3_1 = L3_1.set_mpattribute
          L4_1 = "TEL:LuaContextualDropWin10Outlook"
          L3_1(L4_1)
          L3_1 = mp
          L3_1 = L3_1.INFECTED
          return L3_1
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
