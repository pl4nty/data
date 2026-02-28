local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "RPF:TopLevelFile"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.set_mpattribute
  L1_1 = "Lua:IOAVTopLevelHTMLFile"
  L0_1(L1_1)
  L0_1 = mp
  L0_1 = L0_1.set_mpattribute
  L1_1 = "//Lua:GIOAVTopLevelHTMLFile"
  L0_1(L1_1)
else
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "//Lua:GIOAVFirstHTMLFileInContainer"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.getfilename
    L1_1 = mp
    L1_1 = L1_1.FILEPATH_QUERY_LOWERCASE
    L0_1 = L0_1(L1_1)
    L2_1 = L0_1
    L1_1 = L0_1.find
    L3_1 = ".crx->"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if L1_1 == nil then
      L2_1 = L0_1
      L1_1 = L0_1.find
      L3_1 = ".apk->"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if L1_1 == nil then
        L2_1 = L0_1
        L1_1 = L0_1.find
        L3_1 = ".msi->"
        L4_1 = 1
        L5_1 = true
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if L1_1 == nil then
          L2_1 = L0_1
          L1_1 = L0_1.find
          L3_1 = ".xpi->"
          L4_1 = 1
          L5_1 = true
          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
          if L1_1 == nil then
            L1_1 = mp
            L1_1 = L1_1.set_mpattribute
            L2_1 = "Lua:IOAVFirstHTMLFileInContainer"
            L1_1(L2_1)
            L1_1 = mp
            L1_1 = L1_1.set_mpattribute
            L2_1 = "//Lua:GIOAVFirstHTMLFileInContainer"
            L1_1(L2_1)
          end
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
