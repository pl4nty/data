local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FNAME
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_PATH
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "Lua:DownFromWebMail"
L2_1 = L2_1(L3_1)
if not L2_1 then
  if L0_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.len
    L3_1 = L0_1
    L2_1 = L2_1(L3_1)
    if not (L2_1 < 30) then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L0_1
      L4_1 = "\\appdata\\local\\microsoft\\windows\\inetcache\\content.outlook\\"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if L2_1 ~= nil then
        goto lbl_55
      end
    end
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L0_1
    L4_1 = "\\downloads"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 ~= nil then
      L2_1 = isOutlookProcess
      L2_1 = L2_1()
      if L2_1 then
        goto lbl_55
      end
    end
  end
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  do return L2_1 end
  ::lbl_55::
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L0_1
  L4_1 = ":\\recoverybin\\volume-"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 ~= nil then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
if L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.len
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if not (L2_1 < 12) then
    goto lbl_78
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_78::
L3_1 = L1_1
L2_1 = L1_1.sub
L4_1 = -4
L2_1 = L2_1(L3_1, L4_1)
L3_1 = {}
L3_1[".xml"] = true
L3_1.rels = true
L4_1 = L3_1[L2_1]
if L4_1 == true then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = {}
L4_1[".xls->"] = "%.xls%->.+"
L4_1["xlsx->"] = "%.xlsx%->.+"
L4_1[".doc->"] = "%.doc%->.+"
L4_1["docx->"] = "%.docx%->.+"
L4_1[".rtf->"] = "%.rtf%->.+"
L4_1["xlsm->"] = "%.xlsm%->.+"
L4_1["xlsb->"] = "%.xlsb%->.+"
L4_1["xltx->"] = "%.xltx%->.+"
L4_1["xltm->"] = "%.xltm%->.+"
L4_1["xlam->"] = "%.xlam%->.+"
L4_1[".xla->"] = "%.xla%->.+"
L4_1["docm->"] = "%.docm%->.+"
L4_1["dotx->"] = "%.dotx%->.+"
L4_1["dotm->"] = "%.dotm%->.+"
L4_1["pptm->"] = "%.pptm%->.+"
L4_1[".pps->"] = "%.pps%->.+"
L4_1["ppsx->"] = "%.ppsx%->.+"
L4_1[".odt->"] = "%.odt%->.+"
L4_1[".xml->"] = "%.xml%->.+"
L5_1 = pairs
L6_1 = L4_1
L5_1, L6_1, L7_1 = L5_1(L6_1)
for L8_1, L9_1 in L5_1, L6_1, L7_1 do
  L10_1 = string
  L10_1 = L10_1.find
  L11_1 = L1_1
  L12_1 = L8_1
  L13_1 = 1
  L14_1 = true
  L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
  if L10_1 then
    L10_1 = string
    L10_1 = L10_1.match
    L11_1 = L1_1
    L12_1 = L9_1
    L10_1 = L10_1(L11_1, L12_1)
    if L10_1 ~= nil then
      L11_1 = string
      L11_1 = L11_1.len
      L12_1 = L10_1
      L11_1 = L11_1(L12_1)
      if not (L11_1 < 4) then
        goto lbl_139
      end
    end
    L11_1 = mp
    L11_1 = L11_1.CLEAN
    do return L11_1 end
    ::lbl_139::
    L12_1 = L10_1
    L11_1 = L10_1.find
    L13_1 = "/vba"
    L14_1 = 1
    L15_1 = true
    L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
    if L11_1 then
      L12_1 = L10_1
      L11_1 = L10_1.sub
      L13_1 = -4
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 == ".bin" then
        L11_1 = mp
        L11_1 = L11_1.set_mpattribute
        L12_1 = "LUA:MacroInOutlook"
        L11_1(L12_1)
        L11_1 = mp
        L11_1 = L11_1.INFECTED
        return L11_1
      end
      break
    end
    L12_1 = L10_1
    L11_1 = L10_1.find
    L13_1 = ">word/"
    L14_1 = 1
    L15_1 = true
    L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
    if L11_1 then
      L12_1 = L10_1
      L11_1 = L10_1.sub
      L13_1 = -4
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 ~= ".exe" then
        L12_1 = L10_1
        L11_1 = L10_1.sub
        L13_1 = -4
        L11_1 = L11_1(L12_1, L13_1)
        if L11_1 ~= ".scr" then
          break
        end
      end
      L11_1 = mp
      L11_1 = L11_1.set_mpattribute
      L12_1 = "LUA:ExecInOutlook"
      L11_1(L12_1)
      L11_1 = mp
      L11_1 = L11_1.INFECTED
      do return L11_1 end
      break
    end
    L12_1 = L10_1
    L11_1 = L10_1.find
    L13_1 = ".jar->"
    L14_1 = 1
    L15_1 = true
    L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
    if L11_1 then
      L12_1 = L10_1
      L11_1 = L10_1.sub
      L13_1 = -6
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 == ".class" then
        L11_1 = mp
        L11_1 = L11_1.set_mpattribute
        L12_1 = "LUA:JarInOutlook"
        L11_1(L12_1)
        L11_1 = mp
        L11_1 = L11_1.INFECTED
        return L11_1
      end
      break
    end
    L12_1 = L10_1
    L11_1 = L10_1.find
    L13_1 = ">xl/embeddings/"
    L14_1 = 1
    L15_1 = true
    L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
    if L11_1 then
      L12_1 = L10_1
      L11_1 = L10_1.sub
      L13_1 = -4
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 ~= ".bin" then
        L12_1 = L10_1
        L11_1 = L10_1.sub
        L13_1 = -4
        L11_1 = L11_1(L12_1, L13_1)
        if L11_1 ~= ".exe" then
          L12_1 = L10_1
          L11_1 = L10_1.sub
          L13_1 = -4
          L11_1 = L11_1(L12_1, L13_1)
          if L11_1 ~= ".scr" then
            break
          end
        end
      end
      L11_1 = mp
      L11_1 = L11_1.set_mpattribute
      L12_1 = "LUA:ExecInOutlook"
      L11_1(L12_1)
      L11_1 = mp
      L11_1 = L11_1.INFECTED
      do return L11_1 end
      break
    end
    L12_1 = L10_1
    L11_1 = L10_1.find
    L13_1 = ">word/embeddings/ole"
    L14_1 = 1
    L15_1 = true
    L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
    if L11_1 then
      L12_1 = L10_1
      L11_1 = L10_1.sub
      L13_1 = -4
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 ~= ".bin" then
        L12_1 = L10_1
        L11_1 = L10_1.sub
        L13_1 = -4
        L11_1 = L11_1(L12_1, L13_1)
        if L11_1 ~= ".exe" then
          break
        end
      end
      L11_1 = mp
      L11_1 = L11_1.set_mpattribute
      L12_1 = "LUA:ExecInOutlook"
      L11_1(L12_1)
      L11_1 = mp
      L11_1 = L11_1.INFECTED
      do return L11_1 end
      break
    end
    L12_1 = L10_1
    L11_1 = L10_1.find
    L13_1 = "oleobject"
    L14_1 = 1
    L15_1 = true
    L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
    if L11_1 then
      L12_1 = L10_1
      L11_1 = L10_1.sub
      L13_1 = -4
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 == ".bin" then
        L11_1 = mp
        L11_1 = L11_1.set_mpattribute
        L12_1 = "LUA:OleObjInOutlook"
        L11_1(L12_1)
        L11_1 = mp
        L11_1 = L11_1.INFECTED
        return L11_1
      end
      break
    end
    L12_1 = L10_1
    L11_1 = L10_1.match
    L13_1 = ">%(ole stream .%)%->.+"
    L14_1 = 1
    L15_1 = true
    L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
    if L11_1 then
      L12_1 = L10_1
      L11_1 = L10_1.find
      L13_1 = "->(utf-"
      L14_1 = 1
      L15_1 = true
      L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
      if L11_1 == nil then
        L12_1 = L10_1
        L11_1 = L10_1.sub
        L13_1 = -4
        L11_1 = L11_1(L12_1, L13_1)
        if L11_1 ~= ".bin" then
          L12_1 = L10_1
          L11_1 = L10_1.sub
          L13_1 = -4
          L11_1 = L11_1(L12_1, L13_1)
          if L11_1 == ".lnk" then
            L11_1 = mp
            L11_1 = L11_1.set_mpattribute
            L12_1 = "LUA:LnkInOleStreamInOutlook"
            L11_1(L12_1)
            L11_1 = mp
            L11_1 = L11_1.INFECTED
            return L11_1
          end
          break
        end
        L12_1 = L10_1
        L11_1 = L10_1.sub
        L13_1 = -11
        L11_1 = L11_1(L12_1, L13_1)
        if L11_1 == "ole10native" then
          L11_1 = mp
          L11_1 = L11_1.set_mpattribute
          L12_1 = "LUA:OleNativeInOutlook"
          L11_1(L12_1)
          L11_1 = mp
          L11_1 = L11_1.INFECTED
          return L11_1
        end
        L11_1 = mp
        L11_1 = L11_1.set_mpattribute
        L12_1 = "LUA:OleStreamInOutlook"
        L11_1(L12_1)
        L11_1 = mp
        L11_1 = L11_1.INFECTED
        return L11_1
      end
    end
    break
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
