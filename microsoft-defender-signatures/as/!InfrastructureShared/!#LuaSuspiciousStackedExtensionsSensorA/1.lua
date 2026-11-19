-- Threat: !InfrastructureShared
-- Name: !#Lua:SuspiciousStackedExtensionsSensor.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = mp.getfilename()
local l_0_1 = string.lower(string.sub(l_0_0, -4))
local l_0_2 = false
local l_0_3 = false
local l_0_4 = 0
local l_0_5 = {
  [".bat"] = "",
  [".cmd"] = "",
  [".com"] = "",
  [".cpl"] = "",
  [".exe"] = "",
  [".htt"] = "",
  [".jar"] = "",
  [".pif"] = "",
  [".ps1"] = "",
  [".scr"] = "",
  [".vbs"] = ""
}
if l_0_5[l_0_1] then
  local l_0_6 = string.reverse(string.lower(string.sub(l_0_0, 0, string.len(l_0_0) - 4)))
  for l_0_7 in string.gmatch(l_0_6, "[%.%%s^]*(%w+)[%.%%s>_\\/]") do
    l_0_4 = l_0_4 + 1
    if string.len(l_0_7) >= 2 then
      local l_0_8 = {
        exe = "",
        tab = "",
        bat = "",
        dmc = "",
        cmd = "",
        moc = "",
        com = "",
        lpc = "",
        cpl = "",
        tth = "",
        htt = "",
        raj = "",
        jar = "",
        fip = "",
        pif = "",
        ["1sp"] = "",
        ps1 = "",
        rcs = "",
        scr = "",
        sbv = "",
        vbs = "",
        lld = "",
        dll = ""
      }
      local l_0_9 = {
        exe = "",
        txt = "",
        rcs = "",
        scr = "",
        fdp = "",
        pdf = "",
        gnp = "",
        png = "",
        gpj = "",
        jpg = "",
        ftr = "",
        rtf = "",
        tpp = "",
        ppt = "",
        piz = "",
        zip = "",
        slx = "",
        xls = ""
      }
      local l_0_10 = {
        bac = "",
        cab = "",
        pizg = "",
        gzip = "",
        osi = "",
        iso = "",
        rat = "",
        tar = "",
        dhv = "",
        vhd = "",
        piz = "",
        zip = "",
        mhc = "",
        chm = ""
      }
      local l_0_11 = {
        cod = "",
        doc = "",
        mcod = "",
        docm = "",
        xcod = "",
        docx = "",
        tod = "",
        dot = "",
        mtod = "",
        dotm = "",
        xtod = "",
        dotx = "",
        tdo = "",
        odt = "",
        ftr = "",
        rtf = "",
        sdo = "",
        ods = "",
        alx = "",
        xla = "",
        slx = "",
        xls = "",
        malx = "",
        xlam = "",
        bslx = "",
        xlsb = "",
        mslx = "",
        xlsm = "",
        xslx = "",
        xlsx = "",
        tlx = "",
        xlt = "",
        mtlx = "",
        xltm = "",
        xtlx = "",
        xltx = "",
        pdo = "",
        odp = "",
        top = "",
        pot = "",
        mtop = "",
        potm = "",
        xtop = "",
        potx = "",
        app = "",
        ppa = "",
        mapp = "",
        ppam = "",
        spp = "",
        pps = "",
        mspp = "",
        ppsm = "",
        xspp = "",
        ppsx = "",
        tpp = "",
        ppt = "",
        mtpp = "",
        pptm = "",
        xtpp = "",
        pptx = "",
        ina = "",
        ani = "",
        pmb = "",
        bmp = "",
        ruc = "",
        cur = "",
        fme = "",
        emf = "",
        fig = "",
        gif = "",
        oci = "",
        ico = "",
        gepj = "",
        jpeg = "",
        gpj = "",
        jpg = "",
        gnp = "",
        png = "",
        war = "",
        raw = "",
        fit = "",
        tif = "",
        ffit = "",
        tiff = "",
        fmw = "",
        wmf = "",
        fifj = "",
        jfif = "",
        pg3 = "",
        ["3gp"] = "",
        caa = "",
        aac = "",
        fsa = "",
        asf = "",
        iva = "",
        avi = "",
        alf = "",
        fla = "",
        calf = "",
        flac = "",
        vlf = "",
        flv = "",
        u3m = "",
        m3u = "",
        v4m = "",
        m4v = "",
        vkm = "",
        mkv = "",
        vom = "",
        mov = "",
        ["3pm"] = "",
        mp3 = "",
        ["4pm"] = "",
        mp4 = "",
        epm = "",
        mpe = "",
        gepm = "",
        mpeg = "",
        gpm = "",
        mpg = "",
        ggo = "",
        ogg = "",
        amv = "",
        vma = "",
        vaw = "",
        wav = "",
        vmw = "",
        wmv = "",
        txt = "",
        ppc = "",
        cpp = "",
        ssc = "",
        css = "",
        vsc = "",
        csv = "",
        lme = "",
        eml = "",
        codg = "",
        gdoc = "",
        ath = "",
        hta = "",
        mth = "",
        htm = "",
        lmth = "",
        html = "",
        thm = "",
        mht = "",
        fdp = "",
        pdf = "",
        ftt = "",
        ttf = "",
        sd3 = "",
        ["3ds"] = "",
        swa = "",
        aws = "",
        gwd = "",
        dwg = "",
        fxd = "",
        dxf = "",
        saf = "",
        fas = "",
        ["1sp"] = "",
        ps1 = "",
        lnm = "",
        mln = "",
        flp = "",
        plf = "",
        xlv = "",
        vlx = ""
      }
      if l_0_9[l_0_7] and string.find(string.lower(l_0_0), string.reverse(l_0_7), 1, true) ~= 3 then
        l_0_3 = true
      end
      if l_0_1 == ".exe" and (l_0_7 == "dmc" or l_0_7 == "sw" or l_0_7 == "piz" or l_0_7 == "rar" or l_0_7 == "txt" or l_0_7 == "exe" and string.find(l_0_6, "tcestoob", 1, true) ~= nil) or l_0_1 == ".jar" and l_0_7 == "sj" or l_0_4 == 1 and l_0_10[l_0_7] ~= nil or l_0_11[l_0_7] ~= nil or l_0_8[l_0_7] ~= nil then
        l_0_2 = true
      end
      break
    end
  end
  if l_0_2 then
    local l_0_12 = {
      ["zip.exe"] = "",
      ["gzip.exe"] = ""
    }
    l_0_4 = string.len(l_0_0)
    while 0 < l_0_4 and string.byte(l_0_0, l_0_4) ~= 92 do
      l_0_4 = l_0_4 - 1
    end
    if 0 < l_0_4 then
      l_0_4 = l_0_4 + 1
    end
    local l_0_13 = string.sub(l_0_0, l_0_4)
    if l_0_12[string.lower(l_0_13)] then
      return mp.CLEAN
    end
    if l_0_3 then
      mp.set_mpattribute("Lua:SuspiciousStackedExtensionsSensor.B")
      return mp.INFECTED
    else
      local l_0_14 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
      if (l_0_14 == mp.SCANREASON_ONOPEN or l_0_14 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE) and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
