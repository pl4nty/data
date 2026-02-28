local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FNAME
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
L1_1 = {}
L2_1 = ".xls->"
L3_1 = ".xlsx->"
L4_1 = ".doc->"
L5_1 = ".docx->"
L6_1 = ".rtf->"
L7_1 = ".xlsm->"
L8_1 = ".xlsb->"
L9_1 = ".xltx->"
L10_1 = ".xltm->"
L11_1 = ".xlam->"
L12_1 = ".xla->"
L13_1 = ".docm->"
L14_1 = ".dotx->"
L15_1 = ".dotm->"
L16_1 = ".ppt->"
L17_1 = ".pptm->"
L18_1 = ".pps->"
L19_1 = ".pptx->"
L20_1 = ".ppsx->"
L21_1 = ".odt->"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L1_1[5] = L6_1
L1_1[6] = L7_1
L1_1[7] = L8_1
L1_1[8] = L9_1
L1_1[9] = L10_1
L1_1[10] = L11_1
L1_1[11] = L12_1
L1_1[12] = L13_1
L1_1[13] = L14_1
L1_1[14] = L15_1
L1_1[15] = L16_1
L1_1[16] = L17_1
L1_1[17] = L18_1
L1_1[18] = L19_1
L1_1[19] = L20_1
L1_1[20] = L21_1
L2_1 = pairs
L3_1 = L1_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = string
  L7_1 = L7_1.find
  L8_1 = L0_1
  L9_1 = L6_1
  L10_1 = 1
  L11_1 = true
  L7_1, L8_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
  if L8_1 ~= nil then
    L9_1 = string
    L9_1 = L9_1.len
    L10_1 = L0_1
    L9_1 = L9_1(L10_1)
    if L8_1 >= L9_1 or L8_1 < 6 then
      L10_1 = mp
      L10_1 = L10_1.CLEAN
      return L10_1
    end
    L10_1 = mp
    L10_1 = L10_1.get_mpattribute
    L11_1 = "BM_XML_FILE"
    L10_1 = L10_1(L11_1)
    if L10_1 then
      L10_1 = mp
      L10_1 = L10_1.set_mpattribute
      L11_1 = "LuaXmlInOOFile"
      L10_1(L11_1)
    else
      L10_1 = mp
      L10_1 = L10_1.get_mpattribute
      L11_1 = "Lua:LNKExt"
      L10_1 = L10_1(L11_1)
      if L10_1 then
        L10_1 = mp
        L10_1 = L10_1.set_mpattribute
        L11_1 = "LuaLNKOOFile"
        L10_1(L11_1)
      else
        L10_1 = mp
        L10_1 = L10_1.get_mpattribute
        L11_1 = "Lua:VBSExt"
        L10_1 = L10_1(L11_1)
        if L10_1 then
          L10_1 = mp
          L10_1 = L10_1.set_mpattribute
          L11_1 = "LuaVbsInOOFile"
          L10_1(L11_1)
        else
          L10_1 = mp
          L10_1 = L10_1.get_mpattribute
          L11_1 = "Lua:HTAExt"
          L10_1 = L10_1(L11_1)
          if L10_1 then
            L10_1 = mp
            L10_1 = L10_1.set_mpattribute
            L11_1 = "LuaHtaInOOFile"
            L10_1(L11_1)
          else
            L10_1 = mp
            L10_1 = L10_1.get_mpattribute
            L11_1 = "Lua:URLExt"
            L10_1 = L10_1(L11_1)
            if L10_1 then
              L10_1 = mp
              L10_1 = L10_1.set_mpattribute
              L11_1 = "LuaUrlInOOFile"
              L10_1(L11_1)
            else
              L10_1 = mp
              L10_1 = L10_1.get_mpattribute
              L11_1 = "Nscript:Type_ps"
              L10_1 = L10_1(L11_1)
              if L10_1 then
                L10_1 = mp
                L10_1 = L10_1.set_mpattribute
                L11_1 = "LuaPSInOOFile"
                L10_1(L11_1)
              end
            end
          end
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
