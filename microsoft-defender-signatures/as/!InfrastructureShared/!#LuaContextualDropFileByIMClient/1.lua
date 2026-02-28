local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
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
    L1_1 = GetSuspiciuousFileType
    L2_1 = mp
    L2_1 = L2_1.get_contextdata
    L3_1 = mp
    L3_1 = L3_1.CONTEXT_DATA_FILENAME
    L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L2_1(L3_1)
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
    L2_1 = "Lua:ContextualDropFile"
    L3_1 = mp
    L3_1 = L3_1.get_contextdata
    L4_1 = mp
    L4_1 = L4_1.CONTEXT_DATA_PROCESSNAME
    L3_1 = L3_1(L4_1)
    if not L3_1 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = string
    L4_1 = L4_1.lower
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    L3_1 = L4_1
    L4_1 = mp
    L4_1 = L4_1.get_contextdata
    L5_1 = mp
    L5_1 = L5_1.CONTEXT_DATA_FILEPATH
    L4_1 = L4_1(L5_1)
    if not L4_1 then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = L4_1
    L5_1 = L5_1(L6_1)
    L4_1 = L5_1
    if L3_1 == "skype.exe" then
      L5_1 = L2_1
      L6_1 = "Skype"
      L2_1 = L5_1 .. L6_1
      L6_1 = L4_1
      L5_1 = L4_1.find
      L7_1 = "\\skype\\my skype received files"
      L8_1 = 1
      L9_1 = true
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if L5_1 ~= nil then
        L5_1 = L2_1
        L6_1 = "Default"
        L2_1 = L5_1 .. L6_1
      else
        L5_1 = L2_1
        L6_1 = "Ext"
        L2_1 = L5_1 .. L6_1
      end
    elseif L3_1 == "lync.exe" then
      L5_1 = L2_1
      L6_1 = "Lync"
      L2_1 = L5_1 .. L6_1
      L6_1 = L4_1
      L5_1 = L4_1.find
      L7_1 = "\\my received files"
      L8_1 = 1
      L9_1 = true
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if L5_1 ~= nil then
        L5_1 = L2_1
        L6_1 = "Default"
        L2_1 = L5_1 .. L6_1
      else
        L5_1 = L2_1
        L6_1 = "Ext"
        L2_1 = L5_1 .. L6_1
      end
    elseif L3_1 == "yahoomessenger.exe" then
      L5_1 = L2_1
      L6_1 = "Yahoo"
      L2_1 = L5_1 .. L6_1
      L6_1 = L4_1
      L5_1 = L4_1.find
      L7_1 = "\\downloads"
      L8_1 = 1
      L9_1 = true
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if L5_1 ~= nil then
        L5_1 = L2_1
        L6_1 = "Default"
        L2_1 = L5_1 .. L6_1
      else
        L5_1 = L2_1
        L6_1 = "Ext"
        L2_1 = L5_1 .. L6_1
      end
    else
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
    if L1_1 then
      L5_1 = L2_1
      L6_1 = L1_1
      L2_1 = L5_1 .. L6_1
    else
      L5_1 = L2_1
      L6_1 = "Any"
      L2_1 = L5_1 .. L6_1
    end
    L5_1 = mp
    L5_1 = L5_1.set_mpattribute
    L6_1 = L2_1
    L5_1(L6_1)
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
