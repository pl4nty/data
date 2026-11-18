-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/WhamBamler.B!dha
-- Type: 24
-- MpAttributes: RPF:TopLevelFile & (Lua:FileInsideSystemFolder | Lua:FileInsideProgramDataFolder) & !PEPCODE:HasDigitalSignature

local l_0_0 = false
local l_0_1 = mp.getfilesize()
if 15000000 < l_0_1 then
  return mp.CLEAN
end
local l_0_2 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if mp.get_mpattribute("Lua:FileInsideSystemFolder") then
  if l_0_2:find("\\system32\\wbem\\wbemcore.tlb", 1, true) or l_0_2:find("\\system32\\wbem\\wbemnet.dll", 1, true) or l_0_2:find("\\system32\\xwtpw.dll", 1, true) or l_0_2:find("\\system32\\wbem\\suyl.dll", 1, true) or l_0_2:find("\\system32\\wbem\\suyl.tlb", 1, true) or l_0_2:find("\\system32\\explorerf.dll", 1, true) or l_0_2:find("\\system32\\wpdsh.dll", 1, true) or l_0_2:find("\\system32\\wbem\\sppext.tlb", 1, true) or l_0_2:find("\\system32\\wbem\\mstscax.tlb", 1, true) then
    l_0_0 = true
  end
elseif mp.get_mpattribute("Lua:FileInsideProgramDataFolder") and (l_0_2:find("programdata\\microsoft\\windows\\spasetup32.uce", 1, true) or l_0_2:find("programdata\\microsoft\\windows\\spasetup64.uce", 1, true) or l_0_2:find("programdata\\microsoft\\windows\\spasetup.uce", 1, true) or l_0_2:find("programdata\\microsoft\\windows\\caches\\comobj.uce", 1, true)) then
  l_0_0 = true
end
if l_0_0 then
  local l_0_3 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Cryptography")
  if l_0_3 ~= nil then
    local l_0_4 = sysio.GetRegValueAsString(l_0_3, "MachineGuid")
    if l_0_4 ~= nil then
      mp.set_mpattribute(string.format("MpInternal_researchdata=CryptoMachineGuid=%s", l_0_4))
    end
  end
  mp.set_mpattribute("MpNonPIIFileType")
  return mp.INFECTED
end
return mp.CLEAN
