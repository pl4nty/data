-- Threat: !InfrastructureShared
-- Name: 87b399c8284f
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
local l_0_1, l_0_2, l_0_3 = string.find(l_0_0, "%.downloadstring%(%'?\"?https?%://(%d+%.%d+%.%d+%.%d+)")
if l_0_3 then
  return mp.CLEAN
end
if not isIEXfound(l_0_0) then
  return mp.CLEAN
end
local l_0_4 = l_0_0:match("%.downloadstring%('([^']+)'%)")
if not l_0_4 then
  return mp.CLEAN
end
if not string.find(l_0_4, "%.") then
  return mp.CLEAN
end
local l_0_5 = {
  "m.lll.org.ua",
  "filestore.caltech.com",
  "bremmar.com.au",
  "rs.marcopacs.com",
  "rcdsei-rp.djicorp.com",
  "hardware-cdn.rippling.com",
  "raw.githubusercontent.com",
  "bit.ly",
  "aiga.totvscloud.com.br",
  "file.provaltech.com",
  "lt.elevate.net",
  "chocolatey.org",
  "automate.techpath.com.au",
  "lt.flexsupport.net",
  "alldevices.blob.core.windows.net",
  "web.hypervision.xefi.fr",
  "cdn.sierrapacificgroup.com",
  "digacore.hostedrmm.com",
  "status.jh.edu",
  "msjoin.com",
  "pwsh.irs.it.ufl.edu",
  "dd.glancesoftware.com",
  "aigaion.totvscloud.com.br",
  "edgedxfiles4mcdean.blob.core.windows.net",
  "lt10.gmal.co.uk",
  "rmm.myitcrewny.com",
  "bitbucket.org",
  "neptune.group-dis.com",
  "beta.famesystems.de"
}
if contains(l_0_4, l_0_5) then
  return mp.CLEAN
end
local l_0_6, l_0_7 = mp.CheckUrl(l_0_4)
if l_0_6 == 1 and l_0_7 == 1 then
  return mp.CLEAN
end
local l_0_8 = {}
l_0_8.SIG_CONTEXT = "PSHELL_URI"
l_0_8.CONTENT_SOURCE = "POWERSHELL"
l_0_8.PROCESS_CONTEXT = "POWERSHELL.EXE"
l_0_8.FILELESS = "true"
l_0_8.CMDLINE_URL = "true"
l_0_8.TAG = "INTERFLOW"
local l_0_9 = SafeGetUrlReputation({l_0_4}, l_0_8, false, 2000)
if l_0_9.urls[l_0_4] and l_0_9.urls[l_0_4].determination == 2 and l_0_9.urls[l_0_4].confidence >= 60 then
  return mp.INFECTED
end
return mp.CLEAN
