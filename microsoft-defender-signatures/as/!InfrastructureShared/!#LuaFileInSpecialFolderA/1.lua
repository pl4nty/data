local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_PATH
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if 10 < L1_1 then
    L1_1 = mp
    L1_1 = L1_1.getfilesize
    L1_1 = L1_1()
    if L1_1 < 100 then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L2_1 = normalize_path
    L3_1 = L0_1
    L2_1 = L2_1(L3_1)
    L0_1 = L2_1
    if L0_1 == nil then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L2_1 = {}
    L2_1[":\\programdata"] = "programdata"
    L2_1["\\appdata\\roaming"] = "appdata"
    L2_1[":\\program files\\common files"] = "commonprogramfiles"
    L2_1[":\\program files (x86)\\common files"] = "commonprogramfilesx86"
    L2_1["\\appdata\\local\\temp"] = "temp"
    L2_1["\\appdata\\local"] = "localappdata"
    L2_1["\\appdata\\locallow"] = "locallowappdata"
    L2_1[":\\program files"] = "programfiles"
    L2_1[":\\program files (x86)"] = "programfilesx86"
    L2_1[":\\users\\public"] = "public"
    L2_1[":\\windows\\system32\\wbem"] = "wbem"
    L2_1[":\\windows\\syswow64\\wbem"] = "wbem"
    L2_1[":\\windows\\servicing"] = "servicing"
    L2_1[":\\windows\\system32"] = "sysdir"
    L2_1[":\\windows\\syswow64"] = "syswow64"
    L2_1[":\\windows"] = "windir"
    L3_1 = pairs
    L4_1 = L2_1
    L3_1, L4_1, L5_1 = L3_1(L4_1)
    for L6_1, L7_1 in L3_1, L4_1, L5_1 do
      L8_1 = #L0_1
      L9_1 = #L6_1
      if L8_1 > L9_1 then
        L9_1 = L0_1
        L8_1 = L0_1.find
        L10_1 = L6_1
        L11_1 = 1
        L12_1 = true
        L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
        if L8_1 then
          L8_1 = "Lua:Context/FileInPath.A!"
          L9_1 = L7_1
          L8_1 = L8_1 .. L9_1
          L9_1 = mp
          L9_1 = L9_1.set_mpattribute
          L10_1 = L8_1
          L9_1(L10_1)
          L9_1 = mp
          L9_1 = L9_1.CLEAN
          return L9_1
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
