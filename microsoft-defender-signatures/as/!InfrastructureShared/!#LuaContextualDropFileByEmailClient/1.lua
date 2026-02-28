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
    L1_1 = mp
    L1_1 = L1_1.get_contextdata
    L2_1 = mp
    L2_1 = L2_1.CONTEXT_DATA_PROCESSNAME
    L1_1 = L1_1(L2_1)
    if not L1_1 then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    L1_1 = L2_1
    if L1_1 == "outlook.exe" or L1_1 == "olk.exe" then
      L2_1 = "Lua:ContextualDropFileOutlook"
      L3_1 = GetSuspiciuousFileType
      L4_1 = mp
      L4_1 = L4_1.get_contextdata
      L5_1 = mp
      L5_1 = L5_1.CONTEXT_DATA_FILENAME
      L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L4_1(L5_1)
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
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
      L6_1 = L4_1
      L5_1 = L4_1.find
      L7_1 = "\\microsoft\\windows\\inetcache\\content.outlook\\"
      L8_1 = 1
      L9_1 = true
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if L5_1 == nil then
        L6_1 = L4_1
        L5_1 = L4_1.find
        L7_1 = "\\attachments\\"
        L8_1 = 1
        L9_1 = true
        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
        if L5_1 == nil then
          L6_1 = L4_1
          L5_1 = L4_1.find
          L7_1 = "\\microsoft\\windows\\inetcache\\ie\\"
          L8_1 = 1
          L9_1 = true
          L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
          if L5_1 == nil then
            L6_1 = L4_1
            L5_1 = L4_1.find
            L7_1 = "%internet_cache%\\content.outlook\\"
            L8_1 = 1
            L9_1 = true
            L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
            if L5_1 == nil then
              goto lbl_91
            end
          end
        end
      end
      L5_1 = L2_1
      L6_1 = "Default"
      L2_1 = L5_1 .. L6_1
      goto lbl_94
      ::lbl_91::
      L5_1 = L2_1
      L6_1 = "Ext"
      L2_1 = L5_1 .. L6_1
      ::lbl_94::
      if L3_1 then
        L5_1 = L2_1
        L6_1 = L3_1
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
      L5_1 = mp
      L5_1 = L5_1.INFECTED
      return L5_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
