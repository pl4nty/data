-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/WhamBamler.A!dha
-- Type: 9
-- MpAttributes: pea_hasexports & (Lua:FileInsideSystemFolder | Lua:FileInsideProgramDataFolder) & !PEPCODE:HasDigitalSignature

local l_0_0 = mp.getfilesize()
if 100000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = pe.get_versioninfo()
if l_0_1 ~= nil and l_0_1.FileVersion == "2001.12.8530.16385" and l_0_1.ProductName == "Microsoft\194\174 Windows\194\174 Operating System" and l_0_1.CompanyName == "Microsoft Corporation" and l_0_1.OriginalFilename:find(".dll", 1, true) and l_0_1.OriginalFilename ~= "msdtcVSp1res.dll" and l_0_1.OriginalFilename ~= "TxfLog.dll" then
  local l_0_2 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Cryptography")
  if l_0_2 ~= nil then
    local l_0_3 = sysio.GetRegValueAsString(l_0_2, "MachineGuid")
    if l_0_3 ~= nil then
      mp.set_mpattribute(string.format("MpInternal_researchdata=CryptoMachineGuid=%s", l_0_3))
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
