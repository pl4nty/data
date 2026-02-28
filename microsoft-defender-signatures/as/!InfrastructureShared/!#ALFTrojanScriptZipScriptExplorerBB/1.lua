local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
if L0_1 then
  L1_1 = MpCommon
  L1_1 = L1_1.PathToWin32Path
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  L2_1 = "%.zip%.[0-9a-zA-Z]+\\[a-zA-Z0-9]+%.vbs$"
  L3_1 = "%.zip%.[0-9a-zA-Z]+\\[a-zA-Z0-9]+%.vbe$"
  L4_1 = "%.zip%.[0-9a-zA-Z]+\\[a-zA-Z0-9]+%.js$"
  L5_1 = "%.zip%.[0-9a-zA-Z]+\\[a-zA-Z0-9]+%.jse$"
  L7_1 = L1_1
  L6_1 = L1_1.match
  L8_1 = L2_1
  L6_1 = L6_1(L7_1, L8_1)
  if not L6_1 then
    L7_1 = L1_1
    L6_1 = L1_1.match
    L8_1 = L3_1
    L6_1 = L6_1(L7_1, L8_1)
    if not L6_1 then
      L7_1 = L1_1
      L6_1 = L1_1.match
      L8_1 = L4_1
      L6_1 = L6_1(L7_1, L8_1)
      if not L6_1 then
        L7_1 = L1_1
        L6_1 = L1_1.match
        L8_1 = L5_1
        L6_1 = L6_1(L7_1, L8_1)
        if not L6_1 then
          goto lbl_77
        end
      end
    end
  end
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L1_1
  L8_1 = "\\appdata\\local\\temp\\"
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if L6_1 then
    L6_1 = mp
    L6_1 = L6_1.get_contextdata
    L7_1 = mp
    L7_1 = L7_1.CONTEXT_DATA_PROCESSNAME
    L6_1 = L6_1(L7_1)
    if L6_1 ~= nil then
      L7_1 = string
      L7_1 = L7_1.lower
      L8_1 = L6_1
      L7_1 = L7_1(L8_1)
      L9_1 = L7_1
      L8_1 = L7_1.match
      L10_1 = "[^\\]+$"
      L8_1 = L8_1(L9_1, L10_1)
      if L8_1 == nil then
        L9_1 = mp
        L9_1 = L9_1.CLEAN
        return L9_1
      end
      L9_1 = {}
      L9_1["explorer.exe"] = ""
      L10_1 = L9_1[L8_1]
      if L10_1 then
        L10_1 = mp
        L10_1 = L10_1.INFECTED
        return L10_1
      end
    end
  end
end
::lbl_77::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
