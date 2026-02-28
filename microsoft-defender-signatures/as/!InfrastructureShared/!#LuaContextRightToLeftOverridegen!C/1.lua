local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Lua:Context/RightToLeftOverride.A!masquerading"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "Lua:Context/RightToLeftOverride.B!masquerading"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    goto lbl_16
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_16::
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_FILENAME
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1 = L1_1(L2_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if 5 < L1_1 then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = string
    L2_1 = L2_1.sub
    L3_1 = L0_1
    L4_1 = -4
    L2_1 = L2_1(L3_1, L4_1)
    L3_1 = "."
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if L1_1 == nil then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "\226\128\174"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if L1_1 == nil then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
    L1_1 = string
    L1_1 = L1_1.sub
    L2_1 = L0_1
    L3_1 = -3
    L1_1 = L1_1(L2_1, L3_1)
    L2_1 = "Lua:Context/RightToLeftOverride.gen!A"
    L3_1 = {}
    L3_1[".7z"] = "Lua:Context/RightToLeftOverride.C"
    L3_1.zip = "Lua:Context/RightToLeftOverride.C"
    L3_1.rar = "Lua:Context/RightToLeftOverride.C"
    L3_1.cmd = "Lua:Context/RightToLeftOverride.D"
    L3_1.bat = "Lua:Context/RightToLeftOverride.D"
    L3_1.vbe = "Lua:Context/RightToLeftOverride.D"
    L3_1.vbs = "Lua:Context/RightToLeftOverride.D"
    L3_1[".js"] = "Lua:Context/RightToLeftOverride.D"
    L3_1.jse = "Lua:Context/RightToLeftOverride.D"
    L3_1.wsh = "Lua:Context/RightToLeftOverride.D"
    L3_1.wsf = "Lua:Context/RightToLeftOverride.D"
    L3_1.ps1 = "Lua:Context/RightToLeftOverride.D"
    L3_1.jar = "Lua:Context/RightToLeftOverride.D"
    L3_1.hta = "Lua:Context/RightToLeftOverride.D"
    L3_1.lnk = "Lua:Context/RightToLeftOverride.D"
    L3_1.exe = "Lua:Context/RightToLeftOverride.E"
    L3_1.scr = "Lua:Context/RightToLeftOverride.E"
    L3_1.com = "Lua:Context/RightToLeftOverride.E"
    L3_1.pif = "Lua:Context/RightToLeftOverride.E"
    L3_1.dav = "Lua:Context/RightToLeftOverride.F"
    L4_1 = L3_1[L1_1]
    if L4_1 == nil then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L2_1 = L3_1[L1_1]
    L5_1 = L0_1
    L4_1 = L0_1.gsub
    L6_1 = " "
    L7_1 = ""
    L4_1 = L4_1(L5_1, L6_1, L7_1)
    L5_1 = string
    L5_1 = L5_1.gsub
    L6_1 = L4_1
    L7_1 = "\226[\128-\129][^\174]"
    L8_1 = ""
    L5_1 = L5_1(L6_1, L7_1, L8_1)
    L4_1 = L5_1
    L5_1 = string
    L5_1 = L5_1.gmatch
    L6_1 = L4_1
    L7_1 = "\226\128\174(.[%w%p%s]+)"
    L5_1 = L5_1(L6_1, L7_1)
    L6_1 = {}
    L7_1 = 0
    L8_1 = L5_1
    L9_1 = nil
    L10_1 = nil
    for L11_1 in L8_1, L9_1, L10_1 do
      L12_1 = #L11_1
      if L12_1 == 3 then
        L6_1[L11_1] = true
        L7_1 = L7_1 + 1
      else
        L12_1 = #L11_1
        if 3 < L12_1 then
          L12_1 = string
          L12_1 = L12_1.sub
          L13_1 = L11_1
          L14_1 = 0
          L15_1 = 3
          L12_1 = L12_1(L13_1, L14_1, L15_1)
          L6_1[L12_1] = true
          L12_1 = string
          L12_1 = L12_1.sub
          L13_1 = L11_1
          L14_1 = 0
          L15_1 = 4
          L12_1 = L12_1(L13_1, L14_1, L15_1)
          L6_1[L12_1] = true
          L7_1 = L7_1 + 2
        end
      end
    end
    if L7_1 == 0 then
      L8_1 = mp
      L8_1 = L8_1.CLEAN
      return L8_1
    end
    L8_1 = {}
    L8_1.cod = "doc"
    L8_1.xcod = "docx"
    L8_1.slx = "xls"
    L8_1[".slx"] = "xls"
    L8_1.xslx = "xlsx"
    L8_1[".xsl"] = "xlsx"
    L8_1.tpp = "ppt"
    L8_1.xtpp = "pptx"
    L8_1.ftr = "rtf"
    L8_1.fdp = "pdf"
    L8_1.txt = "txt"
    L8_1.ini = "ini"
    L8_1["4pm"] = "mp4"
    L8_1["3pm"] = "mp3"
    L8_1.vaw = "wav"
    L8_1.iva = "avi"
    L8_1.vkm = "mkv"
    L8_1.bvmr = "rmvb"
    L8_1.vmw = "wmv"
    L8_1.vom = "mov"
    L8_1.vlf = "flv"
    L8_1.a4m = "m4a"
    L8_1.gpj = "jpg"
    L8_1.gepj = "jpeg"
    L8_1.gnp = "png"
    L8_1.pmb = "bmp"
    L8_1.fig = "gif"
    L8_1.pg3 = "3gp"
    L8_1.piz = "zip"
    L8_1.rar = "rar"
    L8_1["z7."] = ".7z"
    L8_1.lmth = "html"
    L8_1.mth = "htm"
    L8_1.php = "php"
    L8_1["3php"] = "php"
    L8_1.mhc = "chm"
    L9_1 = pairs
    L10_1 = L6_1
    L9_1, L10_1, L11_1 = L9_1(L10_1)
    for L12_1, L13_1 in L9_1, L10_1, L11_1 do
      L14_1 = L8_1[L12_1]
      if L14_1 ~= nil then
        L14_1 = mp
        L14_1 = L14_1.set_mpattribute
        L15_1 = L2_1
        L14_1(L15_1)
        L14_1 = mp
        L14_1 = L14_1.INFECTED
        return L14_1
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
