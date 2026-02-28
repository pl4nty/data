local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "%.downloadstring%(%'?\"?https?%://(%d+%.%d+%.%d+%.%d+)"
L1_1, L2_1, L3_1 = L1_1(L2_1, L3_1)
if L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = isIEXfound
L5_1 = L0_1
L4_1 = L4_1(L5_1)
if not L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L5_1 = L0_1
L4_1 = L0_1.match
L6_1 = "%.downloadstring%('([^']+)'%)"
L4_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.find
L6_1 = L4_1
L7_1 = "%."
L5_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = {}
L6_1 = "m.lll.org.ua"
L7_1 = "filestore.caltech.com"
L8_1 = "bremmar.com.au"
L9_1 = "rs.marcopacs.com"
L10_1 = "rcdsei-rp.djicorp.com"
L11_1 = "hardware-cdn.rippling.com"
L12_1 = "raw.githubusercontent.com"
L13_1 = "bit.ly"
L14_1 = "aiga.totvscloud.com.br"
L15_1 = "file.provaltech.com"
L16_1 = "lt.elevate.net"
L17_1 = "chocolatey.org"
L18_1 = "automate.techpath.com.au"
L19_1 = "lt.flexsupport.net"
L20_1 = "alldevices.blob.core.windows.net"
L21_1 = "web.hypervision.xefi.fr"
L22_1 = "cdn.sierrapacificgroup.com"
L23_1 = "digacore.hostedrmm.com"
L24_1 = "status.jh.edu"
L25_1 = "msjoin.com"
L26_1 = "pwsh.irs.it.ufl.edu"
L27_1 = "dd.glancesoftware.com"
L28_1 = "aigaion.totvscloud.com.br"
L29_1 = "edgedxfiles4mcdean.blob.core.windows.net"
L30_1 = "lt10.gmal.co.uk"
L31_1 = "rmm.myitcrewny.com"
L32_1 = "bitbucket.org"
L33_1 = "neptune.group-dis.com"
L34_1 = "beta.famesystems.de"
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L5_1[4] = L9_1
L5_1[5] = L10_1
L5_1[6] = L11_1
L5_1[7] = L12_1
L5_1[8] = L13_1
L5_1[9] = L14_1
L5_1[10] = L15_1
L5_1[11] = L16_1
L5_1[12] = L17_1
L5_1[13] = L18_1
L5_1[14] = L19_1
L5_1[15] = L20_1
L5_1[16] = L21_1
L5_1[17] = L22_1
L5_1[18] = L23_1
L5_1[19] = L24_1
L5_1[20] = L25_1
L5_1[21] = L26_1
L5_1[22] = L27_1
L5_1[23] = L28_1
L5_1[24] = L29_1
L5_1[25] = L30_1
L5_1[26] = L31_1
L5_1[27] = L32_1
L5_1[28] = L33_1
L5_1[29] = L34_1
L6_1 = contains
L7_1 = L4_1
L8_1 = L5_1
L6_1 = L6_1(L7_1, L8_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.CheckUrl
L7_1 = L4_1
L6_1, L7_1 = L6_1(L7_1)
if L6_1 == 1 and L7_1 == 1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = {}
L8_1.SIG_CONTEXT = "PSHELL_URI"
L8_1.CONTENT_SOURCE = "POWERSHELL"
L8_1.PROCESS_CONTEXT = "POWERSHELL.EXE"
L8_1.FILELESS = "true"
L8_1.CMDLINE_URL = "true"
L8_1.TAG = "INTERFLOW"
L9_1 = SafeGetUrlReputation
L10_1 = {}
L11_1 = L4_1
L10_1[1] = L11_1
L11_1 = L8_1
L12_1 = false
L13_1 = 2000
L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
L10_1 = L9_1.urls
L10_1 = L10_1[L4_1]
if L10_1 then
  L10_1 = L9_1.urls
  L10_1 = L10_1[L4_1]
  L10_1 = L10_1.determination
  if L10_1 == 2 then
    L10_1 = L9_1.urls
    L10_1 = L10_1[L4_1]
    L10_1 = L10_1.confidence
    if 60 <= L10_1 then
      L10_1 = mp
      L10_1 = L10_1.INFECTED
      return L10_1
    end
  end
end
L10_1 = mp
L10_1 = L10_1.CLEAN
return L10_1
