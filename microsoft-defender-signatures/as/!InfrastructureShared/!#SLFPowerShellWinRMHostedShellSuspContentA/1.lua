-- Threat: !InfrastructureShared
-- Name: !#SLF:PowerShell/WinRMHostedShellSuspContent.A
-- Type: 13
-- Includes: BMLuaLib, ResearchData
-- MpAttributes: MpIsWinRMHostedShellAMSIScan

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = mp.getfilesize()
if not isnull(r0_0) and not (r0_0 < 16) then
  local r0_1 = r0_0 > 131072 and 131072 or r0_0
  mp.readprotection(false)
  local r0_2 = mp.readfile(0, r0_1)
  mp.readprotection(true)
  if isnull(r0_2) then
    return mp.CLEAN
  end
  local r0_3 = string.lower(tostring(r0_2))

  local function r0_4(p1_0, p1_1)
    for r1_0, r1_1 in ipairs(p1_1) do
      if string.find(p1_0, r1_1, 1, true) then
        return true
      end
    end
    return false
  end

  local r0_5 = {
    "invoke-binary", "dll-loader", "donut-loader", "bypass-4msi", "evil-winrm", "evilwinrm",
    "invoke-donut"
  }
  local r0_6 = {
    "[io.file]::writeallbytes", "[system.io.file]::writeallbytes", "[io.file]::openwrite",
    "[system.io.file]::openwrite", "[io.file]::appendallbytes", "[system.io.file]::appendallbytes"
  }
  local r0_7 = {
    "[io.file]::readallbytes", "[system.io.file]::readallbytes", "-encoding byte", "-asbytestream"
  }
  local r0_8 = {
    "[reflection.assembly]::load", "[system.reflection.assembly]::load", "assembly.load(",
    "invoke-expression", "iex(", "iex (", "virtualalloc", "createthread", "io.memorystream"
  }
  local r0_9 = {
    "amsiutils", "amsiinitfailed", "amsicontext", "amsiscanbuffer", "set-mppreference",
    "add-mppreference", "disablerealtimemonitoring", "etweventprovider", "psetwlogprovider"
  }
  local r0_10 = {
    "sekurlsa", "lsadump", "invoke-mimikatz", "comsvcs", "minidump", "safetykatz", "rubeus",
    "kerberoast", "sharphound", "invoke-bloodhound"
  }
  local r0_11 = {
    "downloadstring", "downloadfile", "net.webclient", "invoke-webrequest", "invoke-restmethod",
    "start-bitstransfer", "system.net.sockets"
  }
  if r0_4(r0_3, r0_5) then
    set_research_data("winrm_amsi_reason", "family_helper", false)
    return mp.INFECTED
  end
  local r0_12 = 0
  local r0_13 = {}
  if r0_4(r0_3, r0_6) and string.find(r0_3, "frombase64string", 1, true) then
    r0_12 = r0_12 + 1
    r0_13[#r0_13 + 1] = "upload"
  end
  if r0_4(r0_3, r0_7) and string.find(r0_3, "tobase64string", 1, true) then
    r0_12 = r0_12 + 1
    r0_13[#r0_13 + 1] = "download"
  end
  if r0_4(r0_3, r0_8) then
    r0_12 = r0_12 + 1
    r0_13[#r0_13 + 1] = "reflective_exec"
  end
  if r0_4(r0_3, r0_9) then
    r0_12 = r0_12 + 1
    r0_13[#r0_13 + 1] = "defense_evasion"
  end
  if r0_4(r0_3, r0_10) then
    r0_12 = r0_12 + 1
    r0_13[#r0_13 + 1] = "credential_access"
  end
  if r0_4(r0_3, r0_11) then
    r0_12 = r0_12 + 1
    r0_13[#r0_13 + 1] = "cradle"
  end
  if r0_12 < 2 then
    return mp.CLEAN
  end
  set_research_data("winrm_amsi_reason", table.concat(r0_13, ","), false)
  set_research_data("winrm_amsi_categories", tostring(r0_12), false)
  return mp.INFECTED
end
return mp.CLEAN
