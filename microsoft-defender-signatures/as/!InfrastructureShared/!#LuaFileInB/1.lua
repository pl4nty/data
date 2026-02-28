local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_PATH
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
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
    L2_1["\\appdata\\local"] = "localappdata"
    L2_1["\\appdata\\locallow"] = "locallowappdata"
    L2_1[":\\program files"] = "programfiles"
    L2_1[":\\program files (x86)"] = "programfilesx86"
    L2_1[":\\users\\public"] = "public"
    L2_1[":\\windows"] = "windir"
    L2_1[":\\windows\\system32"] = "sysdir"
    L2_1[":\\windows\\syswow64"] = "syswow64"
    L2_1["\\appdata\\local\\temp"] = "temp"
    L2_1[":\\windows\\system32\\wbem"] = "wbem"
    L2_1[":\\windows\\syswow64\\wbem"] = "wbem"
    L2_1[":\\windows\\servicing"] = "servicing"
    L3_1 = pairs
    L4_1 = L2_1
    L3_1, L4_1, L5_1 = L3_1(L4_1)
    for L6_1, L7_1 in L3_1, L4_1, L5_1 do
      L8_1 = #L0_1
      L9_1 = #L6_1
      if L8_1 > L9_1 then
        L8_1 = string
        L8_1 = L8_1.sub
        L9_1 = L0_1
        L10_1 = #L6_1
        L10_1 = -L10_1
        L8_1 = L8_1(L9_1, L10_1)
        if L8_1 == L6_1 then
          L9_1 = "Lua:Context/FileInBasePath.A!"
          L10_1 = L7_1
          L9_1 = L9_1 .. L10_1
          L10_1 = mp
          L10_1 = L10_1.set_mpattribute
          L11_1 = L9_1
          L10_1(L11_1)
          L10_1 = mp
          L10_1 = L10_1.CLEAN
          return L10_1
        end
      end
    end
    L3_1 = string
    L3_1 = L3_1.sub
    L4_1 = L0_1
    L5_1 = 1
    L6_1 = 2
    L3_1 = L3_1(L4_1, L5_1, L6_1)
    if L3_1 == "\\\\" then
      L3_1 = mp
      L3_1 = L3_1.set_mpattribute
      L4_1 = "Lua:Context/FileInNetworkShare.A"
      L3_1(L4_1)
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = #L0_1
    if 35 < L3_1 then
      L3_1 = string
      L3_1 = L3_1.sub
      L4_1 = L0_1
      L5_1 = 2
      L6_1 = 17
      L3_1 = L3_1(L4_1, L5_1, L6_1)
      if L3_1 == ":\\windows\\winsxs" then
        L3_1 = mp
        L3_1 = L3_1.set_mpattribute
        L4_1 = "Lua:Context/FileInSubStrPath.A!winsxs"
        L3_1(L4_1)
        L3_1 = mp
        L3_1 = L3_1.CLEAN
        return L3_1
      end
      L3_1 = string
      L3_1 = L3_1.sub
      L4_1 = L0_1
      L5_1 = 2
      L6_1 = 31
      L3_1 = L3_1(L4_1, L5_1, L6_1)
      if L3_1 == ":\\windows\\softwaredistribution" then
        L3_1 = mp
        L3_1 = L3_1.set_mpattribute
        L4_1 = "Lua:Context/FileInSubStrPath.A!softwaredistribution"
        L3_1(L4_1)
        L3_1 = mp
        L3_1 = L3_1.CLEAN
        return L3_1
      end
      L3_1 = string
      L3_1 = L3_1.sub
      L4_1 = L0_1
      L5_1 = 2
      L6_1 = 15
      L3_1 = L3_1(L4_1, L5_1, L6_1)
      if L3_1 == ":\\windows\\csc\\" then
        L3_1 = mp
        L3_1 = L3_1.set_mpattribute
        L4_1 = "Lua:Context/FileInSubStrPath.A!csc"
        L3_1(L4_1)
        L3_1 = mp
        L3_1 = L3_1.CLEAN
        return L3_1
      end
      L3_1 = string
      L3_1 = L3_1.sub
      L4_1 = L0_1
      L5_1 = 2
      L6_1 = 20
      L3_1 = L3_1(L4_1, L5_1, L6_1)
      if L3_1 == ":\\windows\\assembly\\" then
        L3_1 = mp
        L3_1 = L3_1.set_mpattribute
        L4_1 = "Lua:Context/FileInSubStrPath.A!assembly"
        L3_1(L4_1)
        L3_1 = mp
        L3_1 = L3_1.CLEAN
        return L3_1
      end
      L3_1 = string
      L3_1 = L3_1.sub
      L4_1 = L0_1
      L5_1 = 2
      L6_1 = 21
      L3_1 = L3_1(L4_1, L5_1, L6_1)
      if L3_1 == ":\\windows\\servicing\\" then
        L3_1 = mp
        L3_1 = L3_1.set_mpattribute
        L4_1 = "Lua:Context/FileInSubStrPath.A!servicing"
        L3_1(L4_1)
        L3_1 = mp
        L3_1 = L3_1.CLEAN
        return L3_1
      end
      L3_1 = string
      L3_1 = L3_1.sub
      L4_1 = L0_1
      L5_1 = 2
      L6_1 = 35
      L3_1 = L3_1(L4_1, L5_1, L6_1)
      if L3_1 ~= ":\\windows\\microsoft.net\\framework\\" then
        L3_1 = string
        L3_1 = L3_1.sub
        L4_1 = L0_1
        L5_1 = 2
        L6_1 = 37
        L3_1 = L3_1(L4_1, L5_1, L6_1)
        if L3_1 ~= ":\\windows\\microsoft.net\\framework64\\" then
          goto lbl_194
        end
      end
      L3_1 = mp
      L3_1 = L3_1.set_mpattribute
      L4_1 = "Lua:Context/FileInSubStrPath.A!framework"
      L3_1(L4_1)
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      do return L3_1 end
      ::lbl_194::
      L3_1 = string
      L3_1 = L3_1.sub
      L4_1 = L0_1
      L5_1 = 2
      L6_1 = 51
      L3_1 = L3_1(L4_1, L5_1, L6_1)
      if L3_1 == ":\\programdata\\microsoft\\windows defender\\platform\\" then
        L3_1 = mp
        L3_1 = L3_1.set_mpattribute
        L4_1 = "Lua:Context/FileInSubStrPath.A!wdplatform"
        L3_1(L4_1)
        L3_1 = mp
        L3_1 = L3_1.CLEAN
        return L3_1
      end
      L3_1 = string
      L3_1 = L3_1.sub
      L4_1 = L0_1
      L5_1 = 2
      L6_1 = 22
      L3_1 = L3_1(L4_1, L5_1, L6_1)
      if L3_1 == ":\\windows\\installer\\{" then
        L3_1 = mp
        L3_1 = L3_1.set_mpattribute
        L4_1 = "Lua:Context/FileInSubStrPath.A!windowsinstaller"
        L3_1(L4_1)
        L3_1 = mp
        L3_1 = L3_1.CLEAN
        return L3_1
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
