-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\87b399c8284f\1_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_2, l_0_3 = nil
  end
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_4, l_0_5, l_0_6 = , (string.find)(l_0_0, "%.downloadstring%(%\'?\"?https?%://(%d+%.%d+%.%d+%.%d+)")
  if "%.downloadstring%(%\'?\"?https?%://(%d+%.%d+%.%d+%.%d+)" then
    return mp.CLEAN
  end
  if not isIEXfound(l_0_4) then
    return mp.CLEAN
  end
  local l_0_7 = nil
  if not l_0_4:match("%.downloadstring%(\'([^\']+)\'%)") then
    return mp.CLEAN
  end
  if not (string.find)(l_0_4:match("%.downloadstring%(\'([^\']+)\'%)"), "%.") then
    return mp.CLEAN
  end
  local l_0_8 = nil
  if contains(l_0_8, {"m.lll.org.ua", "filestore.caltech.com", "bremmar.com.au", "rs.marcopacs.com", "rcdsei-rp.djicorp.com", "hardware-cdn.rippling.com", "raw.githubusercontent.com", "bit.ly", "aiga.totvscloud.com.br", "file.provaltech.com", "lt.elevate.net", "chocolatey.org", "automate.techpath.com.au", "lt.flexsupport.net", "alldevices.blob.core.windows.net", "web.hypervision.xefi.fr", "cdn.sierrapacificgroup.com", "digacore.hostedrmm.com", "status.jh.edu", "msjoin.com", "pwsh.irs.it.ufl.edu", "dd.glancesoftware.com", "aigaion.totvscloud.com.br", "edgedxfiles4mcdean.blob.core.windows.net", "lt10.gmal.co.uk", "rmm.myitcrewny.com", "bitbucket.org", "neptune.group-dis.com", "beta.famesystems.de"}) then
    return mp.CLEAN
  end
  local l_0_9, l_0_10 = , (mp.CheckUrl)(l_0_8)
  if l_0_10 == 1 and l_0_8 == 1 then
    return mp.CLEAN
  end
  local l_0_11 = nil
  local l_0_12 = {SIG_CONTEXT = "PSHELL_URI", CONTENT_SOURCE = "POWERSHELL", PROCESS_CONTEXT = "POWERSHELL.EXE", FILELESS = "true", CMDLINE_URL = "true", TAG = "INTERFLOW"}
  local l_0_13 = SafeGetUrlReputation
  l_0_13 = l_0_13({l_0_8}, l_0_12, false, 2000)
  if (l_0_13.urls)[l_0_8] and ((l_0_13.urls)[l_0_8]).determination == 2 and ((l_0_13.urls)[l_0_8]).confidence >= 60 then
    return mp.INFECTED
  end
  return mp.CLEAN
end

