-- Threat: !InfrastructureShared
-- Name: !#ALFPER:Trojan:Win64/FalconAnvil.A!dha
-- Type: 10
-- MpAttributes: RPF:TopLevelFile & pea_hasappendeddata & !pea_ismsil & !pea_isvbnative & !pea_isvbpcode & !PEPCODE:HasDigitalSignature

local l_0_0 = {
  "Win32/AutoIt",
  "Win32/AutoIt_HSTR1",
  "Win32/AutoIt_HSTR2",
  "HSTR:Win32/DelphiFile",
  "SIGATTR:DelphiFile",
  "HSTR:NSIS.gen!A",
  "HSTR:NSIS_Installer"
}
for l_0_1, l_0_2 in ipairs(l_0_0) do
  if mp.get_mpattribute(l_0_2) then
    return mp.CLEAN
  end
end
local l_0_3 = mp.getfilesize()
if 15728640 < l_0_3 then
  return mp.CLEAN
end
if l_0_3 < 204800 then
  return mp.CLEAN
end
local l_0_4 = pehdr.NumberOfSections
if l_0_4 == nil or l_0_4 == 0 then
  return mp.CLEAN
end
local l_0_5 = pesecs[l_0_4]
if l_0_5 == nil then
  return mp.CLEAN
end
local l_0_6 = l_0_5.PointerToRawData + l_0_5.SizeOfRawData
if l_0_6 == nil or l_0_3 == nil then
  return mp.CLEAN
end
if l_0_3 <= l_0_6 then
  return mp.CLEAN
end
if l_0_3 - l_0_6 < 16 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_7 = mp.readfile(l_0_6, 16)
if l_0_7 == nil then
  return mp.CLEAN
end
if l_0_7 == "EMBED_PAYLOAD_v2" then
  return mp.INFECTED
end
return mp.CLEAN
