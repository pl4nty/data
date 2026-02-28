local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = mp
L0_1 = L0_1.getfilename
L0_1 = L0_1()
L1_1 = string
L1_1 = L1_1.lower
L2_1 = string
L2_1 = L2_1.sub
L3_1 = L0_1
L4_1 = -4
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1)
L2_1 = false
L3_1 = false
L4_1 = 0
L5_1 = {}
L5_1[".bat"] = ""
L5_1[".cmd"] = ""
L5_1[".com"] = ""
L5_1[".cpl"] = ""
L5_1[".exe"] = ""
L5_1[".htt"] = ""
L5_1[".jar"] = ""
L5_1[".pif"] = ""
L5_1[".ps1"] = ""
L5_1[".scr"] = ""
L5_1[".vbs"] = ""
L6_1 = L5_1[L1_1]
if L6_1 then
  L6_1 = string
  L6_1 = L6_1.reverse
  L7_1 = string
  L7_1 = L7_1.lower
  L8_1 = string
  L8_1 = L8_1.sub
  L9_1 = L0_1
  L10_1 = 0
  L11_1 = string
  L11_1 = L11_1.len
  L12_1 = L0_1
  L11_1 = L11_1(L12_1)
  L11_1 = L11_1 - 4
  L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1 = L8_1(L9_1, L10_1, L11_1)
  L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1)
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1)
  L7_1 = string
  L7_1 = L7_1.gmatch
  L8_1 = L6_1
  L9_1 = "[%.%%s^]*(%w+)[%.%%s>_\\/]"
  L7_1, L8_1, L9_1 = L7_1(L8_1, L9_1)
  for L10_1 in L7_1, L8_1, L9_1 do
    L4_1 = L4_1 + 1
    L11_1 = string
    L11_1 = L11_1.len
    L12_1 = L10_1
    L11_1 = L11_1(L12_1)
    if 2 <= L11_1 then
      L11_1 = {}
      L11_1.exe = ""
      L11_1.tab = ""
      L11_1.bat = ""
      L11_1.dmc = ""
      L11_1.cmd = ""
      L11_1.moc = ""
      L11_1.com = ""
      L11_1.lpc = ""
      L11_1.cpl = ""
      L11_1.tth = ""
      L11_1.htt = ""
      L11_1.raj = ""
      L11_1.jar = ""
      L11_1.fip = ""
      L11_1.pif = ""
      L11_1["1sp"] = ""
      L11_1.ps1 = ""
      L11_1.rcs = ""
      L11_1.scr = ""
      L11_1.sbv = ""
      L11_1.vbs = ""
      L11_1.lld = ""
      L11_1.dll = ""
      L12_1 = {}
      L12_1.exe = ""
      L12_1.txt = ""
      L12_1.rcs = ""
      L12_1.scr = ""
      L12_1.fdp = ""
      L12_1.pdf = ""
      L12_1.gnp = ""
      L12_1.png = ""
      L12_1.gpj = ""
      L12_1.jpg = ""
      L12_1.ftr = ""
      L12_1.rtf = ""
      L12_1.tpp = ""
      L12_1.ppt = ""
      L12_1.piz = ""
      L12_1.zip = ""
      L12_1.slx = ""
      L12_1.xls = ""
      L13_1 = {}
      L13_1.bac = ""
      L13_1.cab = ""
      L13_1.pizg = ""
      L13_1.gzip = ""
      L13_1.osi = ""
      L13_1.iso = ""
      L13_1.rat = ""
      L13_1.tar = ""
      L13_1.dhv = ""
      L13_1.vhd = ""
      L13_1.piz = ""
      L13_1.zip = ""
      L13_1.mhc = ""
      L13_1.chm = ""
      L14_1 = {}
      L14_1.cod = ""
      L14_1.doc = ""
      L14_1.mcod = ""
      L14_1.docm = ""
      L14_1.xcod = ""
      L14_1.docx = ""
      L14_1.tod = ""
      L14_1.dot = ""
      L14_1.mtod = ""
      L14_1.dotm = ""
      L14_1.xtod = ""
      L14_1.dotx = ""
      L14_1.tdo = ""
      L14_1.odt = ""
      L14_1.ftr = ""
      L14_1.rtf = ""
      L14_1.sdo = ""
      L14_1.ods = ""
      L14_1.alx = ""
      L14_1.xla = ""
      L14_1.slx = ""
      L14_1.xls = ""
      L14_1.malx = ""
      L14_1.xlam = ""
      L14_1.bslx = ""
      L14_1.xlsb = ""
      L14_1.mslx = ""
      L14_1.xlsm = ""
      L14_1.xslx = ""
      L14_1.xlsx = ""
      L14_1.tlx = ""
      L14_1.xlt = ""
      L14_1.mtlx = ""
      L14_1.xltm = ""
      L14_1.xtlx = ""
      L14_1.xltx = ""
      L14_1.pdo = ""
      L14_1.odp = ""
      L14_1.top = ""
      L14_1.pot = ""
      L14_1.mtop = ""
      L14_1.potm = ""
      L14_1.xtop = ""
      L14_1.potx = ""
      L14_1.app = ""
      L14_1.ppa = ""
      L14_1.mapp = ""
      L14_1.ppam = ""
      L14_1.spp = ""
      L14_1.pps = ""
      L14_1.mspp = ""
      L14_1.ppsm = ""
      L14_1.xspp = ""
      L14_1.ppsx = ""
      L14_1.tpp = ""
      L14_1.ppt = ""
      L14_1.mtpp = ""
      L14_1.pptm = ""
      L14_1.xtpp = ""
      L14_1.pptx = ""
      L14_1.ina = ""
      L14_1.ani = ""
      L14_1.pmb = ""
      L14_1.bmp = ""
      L14_1.ruc = ""
      L14_1.cur = ""
      L14_1.fme = ""
      L14_1.emf = ""
      L14_1.fig = ""
      L14_1.gif = ""
      L14_1.oci = ""
      L14_1.ico = ""
      L14_1.gepj = ""
      L14_1.jpeg = ""
      L14_1.gpj = ""
      L14_1.jpg = ""
      L14_1.gnp = ""
      L14_1.png = ""
      L14_1.war = ""
      L14_1.raw = ""
      L14_1.fit = ""
      L14_1.tif = ""
      L14_1.ffit = ""
      L14_1.tiff = ""
      L14_1.fmw = ""
      L14_1.wmf = ""
      L14_1.fifj = ""
      L14_1.jfif = ""
      L14_1.pg3 = ""
      L14_1["3gp"] = ""
      L14_1.caa = ""
      L14_1.aac = ""
      L14_1.fsa = ""
      L14_1.asf = ""
      L14_1.iva = ""
      L14_1.avi = ""
      L14_1.alf = ""
      L14_1.fla = ""
      L14_1.calf = ""
      L14_1.flac = ""
      L14_1.vlf = ""
      L14_1.flv = ""
      L14_1.u3m = ""
      L14_1.m3u = ""
      L14_1.v4m = ""
      L14_1.m4v = ""
      L14_1.vkm = ""
      L14_1.mkv = ""
      L14_1.vom = ""
      L14_1.mov = ""
      L14_1["3pm"] = ""
      L14_1.mp3 = ""
      L14_1["4pm"] = ""
      L14_1.mp4 = ""
      L14_1.epm = ""
      L14_1.mpe = ""
      L14_1.gepm = ""
      L14_1.mpeg = ""
      L14_1.gpm = ""
      L14_1.mpg = ""
      L14_1.ggo = ""
      L14_1.ogg = ""
      L14_1.amv = ""
      L14_1.vma = ""
      L14_1.vaw = ""
      L14_1.wav = ""
      L14_1.vmw = ""
      L14_1.wmv = ""
      L14_1.txt = ""
      L14_1.ppc = ""
      L14_1.cpp = ""
      L14_1.ssc = ""
      L14_1.css = ""
      L14_1.vsc = ""
      L14_1.csv = ""
      L14_1.lme = ""
      L14_1.eml = ""
      L14_1.codg = ""
      L14_1.gdoc = ""
      L14_1.ath = ""
      L14_1.hta = ""
      L14_1.mth = ""
      L14_1.htm = ""
      L14_1.lmth = ""
      L14_1.html = ""
      L14_1.thm = ""
      L14_1.mht = ""
      L14_1.fdp = ""
      L14_1.pdf = ""
      L14_1.ftt = ""
      L14_1.ttf = ""
      L14_1.sd3 = ""
      L14_1["3ds"] = ""
      L14_1.swa = ""
      L14_1.aws = ""
      L14_1.gwd = ""
      L14_1.dwg = ""
      L14_1.fxd = ""
      L14_1.dxf = ""
      L14_1.saf = ""
      L14_1.fas = ""
      L14_1["1sp"] = ""
      L14_1.ps1 = ""
      L14_1.lnm = ""
      L14_1.mln = ""
      L14_1.flp = ""
      L14_1.plf = ""
      L14_1.xlv = ""
      L14_1.vlx = ""
      L15_1 = L12_1[L10_1]
      if L15_1 then
        L15_1 = string
        L15_1 = L15_1.find
        L16_1 = string
        L16_1 = L16_1.lower
        L17_1 = L0_1
        L16_1 = L16_1(L17_1)
        L17_1 = string
        L17_1 = L17_1.reverse
        L18_1 = L10_1
        L17_1 = L17_1(L18_1)
        L18_1 = 1
        L19_1 = true
        L15_1 = L15_1(L16_1, L17_1, L18_1, L19_1)
        if L15_1 ~= 3 then
          L3_1 = true
        end
      end
      if L1_1 == ".exe" then
        if L10_1 == "dmc" or L10_1 == "sw" or L10_1 == "piz" or L10_1 == "rar" or L10_1 == "txt" then
          goto lbl_344
        end
        if L10_1 == "exe" then
          L15_1 = string
          L15_1 = L15_1.find
          L16_1 = L6_1
          L17_1 = "tcestoob"
          L18_1 = 1
          L19_1 = true
          L15_1 = L15_1(L16_1, L17_1, L18_1, L19_1)
        end
      end
      if L15_1 == nil and (L1_1 ~= ".jar" or L10_1 ~= "sj") then
        if L4_1 == 1 then
          L15_1 = L13_1[L10_1]
          if L15_1 ~= nil then
            goto lbl_344
          end
        end
        L15_1 = L14_1[L10_1]
        if L15_1 == nil then
          L15_1 = L11_1[L10_1]
          if L15_1 == nil then
            break
          end
        end
      end
      ::lbl_344::
      L2_1 = true
      break
    end
  end
  if L2_1 then
    L7_1 = {}
    L7_1["zip.exe"] = ""
    L7_1["gzip.exe"] = ""
    L8_1 = string
    L8_1 = L8_1.len
    L9_1 = L0_1
    L8_1 = L8_1(L9_1)
    L4_1 = L8_1
    while 0 < L4_1 do
      L8_1 = string
      L8_1 = L8_1.byte
      L9_1 = L0_1
      L10_1 = L4_1
      L8_1 = L8_1(L9_1, L10_1)
      if L8_1 == 92 then
        break
      end
      L4_1 = L4_1 - 1
    end
    if 0 < L4_1 then
      L4_1 = L4_1 + 1
    end
    L8_1 = string
    L8_1 = L8_1.sub
    L9_1 = L0_1
    L10_1 = L4_1
    L8_1 = L8_1(L9_1, L10_1)
    L9_1 = string
    L9_1 = L9_1.lower
    L10_1 = L8_1
    L9_1 = L9_1(L10_1)
    L9_1 = L7_1[L9_1]
    if L9_1 then
      L9_1 = mp
      L9_1 = L9_1.CLEAN
      return L9_1
    end
    if L3_1 then
      L9_1 = mp
      L9_1 = L9_1.set_mpattribute
      L10_1 = "Lua:SuspiciousStackedExtensionsSensor.B"
      L9_1(L10_1)
      L9_1 = mp
      L9_1 = L9_1.INFECTED
      return L9_1
    else
      L9_1 = mp
      L9_1 = L9_1.get_contextdata
      L10_1 = mp
      L10_1 = L10_1.CONTEXT_DATA_SCANREASON
      L9_1 = L9_1(L10_1)
      L10_1 = mp
      L10_1 = L10_1.SCANREASON_ONOPEN
      if L9_1 ~= L10_1 then
        L10_1 = mp
        L10_1 = L10_1.SCANREASON_ONMODIFIEDHANDLECLOSE
        if L9_1 ~= L10_1 then
          goto lbl_420
        end
      end
      L10_1 = mp
      L10_1 = L10_1.get_contextdata
      L11_1 = mp
      L11_1 = L11_1.CONTEXT_DATA_NEWLYCREATEDHINT
      L10_1 = L10_1(L11_1)
      if L10_1 == true then
        L10_1 = mp
        L10_1 = L10_1.INFECTED
        return L10_1
      end
    end
  end
end
::lbl_420::
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
