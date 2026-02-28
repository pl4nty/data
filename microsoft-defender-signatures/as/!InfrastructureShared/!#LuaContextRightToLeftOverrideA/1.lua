local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_FILENAME
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L1_1(L2_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if 5 < L1_1 then
    L1_1 = string
    L1_1 = L1_1.sub
    L2_1 = L0_1
    L3_1 = 0
    L4_1 = 3
    L1_1 = L1_1(L2_1, L3_1, L4_1)
    if L1_1 ~= "\226\128\174" then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L0_1
    L4_1 = "."
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 == nil then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L2_1 = {}
    L2_1.bat = true
    L2_1.exe = true
    L2_1.scr = true
    L2_1.cmd = true
    L2_1.com = true
    L2_1.lnk = true
    L2_1.pif = true
    L2_1.vbe = true
    L2_1.vbs = true
    L2_1[".js"] = true
    L2_1.jse = true
    L2_1.wsh = true
    L2_1.wsf = true
    L2_1.ps1 = true
    L2_1.jar = true
    L2_1.hta = true
    L3_1 = string
    L3_1 = L3_1.sub
    L4_1 = L0_1
    L5_1 = -3
    L3_1 = L3_1(L4_1, L5_1)
    L4_1 = L2_1[L3_1]
    if L4_1 ~= nil then
      L4_1 = #L0_1
      if 10 <= L4_1 then
        L4_1 = {}
        L4_1["cod."] = "doc"
        L4_1["cod "] = "doc"
        L4_1.xcod = "docx"
        L4_1["slx."] = "xls"
        L4_1.xslx = "xlsx"
        L4_1["tpp."] = "ppt"
        L4_1.xtpp = "pptx"
        L4_1["ftr."] = "rtf"
        L4_1["fdp."] = "pdf"
        L4_1["txt."] = "txt"
        L4_1["ini."] = "ini"
        L4_1["4pm."] = "mp4"
        L4_1["3pm."] = "mp3"
        L4_1["vaw."] = "wav"
        L4_1["iva."] = "avi"
        L4_1["vkm."] = "mkv"
        L4_1.bvmr = "rmvb"
        L4_1["vmw."] = "wmv"
        L4_1["vom."] = "mov"
        L4_1["gpj."] = "jpg"
        L4_1["gnp."] = "png"
        L4_1["pmb."] = "bmp"
        L4_1["pg3."] = "3gp"
        L4_1["piz."] = "zip"
        L4_1["rar."] = "rar"
        L4_1.lmth = "html"
        L4_1["mth."] = "htm"
        L5_1 = string
        L5_1 = L5_1.sub
        L6_1 = L0_1
        L7_1 = 4
        L8_1 = 7
        L5_1 = L5_1(L6_1, L7_1, L8_1)
        L6_1 = L4_1[L5_1]
        if L6_1 ~= nil then
          L6_1 = mp
          L6_1 = L6_1.set_mpattribute
          L7_1 = "Lua:Context/RightToLeftOverride.A!fake_"
          L8_1 = L4_1[L5_1]
          L7_1 = L7_1 .. L8_1
          L6_1(L7_1)
          L6_1 = mp
          L6_1 = L6_1.set_mpattribute
          L7_1 = "Lua:Context/RightToLeftOverride.A!masquerading"
          L6_1(L7_1)
          L6_1 = mp
          L6_1 = L6_1.INFECTED
          return L6_1
        end
      end
      L4_1 = mp
      L4_1 = L4_1.set_mpattribute
      L5_1 = "Lua:Context/RightToLeftOverride.A!suspicious"
      L4_1(L5_1)
    end
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
