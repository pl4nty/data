-- Threat: !InfrastructureShared
-- Name: !#Lua:QakbotDigiCert
-- Type: 9
-- MpAttributes: MpHasValidProjPath & PEPCODE:HasDigitalSignature

if peattributes.isexe == true or peattributes.isdll == true then
  local l_0_0 = mp.getfilesize()
  if l_0_0 < 270000 or 300000 < l_0_0 then
    return mp.CLEAN
  end
  local l_0_1 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_SECURITY].RVA
  local l_0_2 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_SECURITY].Size
  local l_0_3 = 128
  local l_0_4 = 336
  if l_0_1 == 0 or l_0_2 < l_0_4 + l_0_3 or l_0_0 <= l_0_1 or l_0_2 > l_0_0 - l_0_1 then
    return mp.CLEAN
  end
  mp.readprotection(false)
  local l_0_5 = mp.readfile(l_0_1 + l_0_4, l_0_3)
  local l_0_6 = mp.crc32(-1, l_0_5, 1, l_0_3)
  if l_0_6 == 51922062 then
    return mp.INFECTED
  end
end
return mp.CLEAN
