-- Threat: !InfrastructureShared
-- Name: !#LUA:HasStolenDigitalSignature
-- Type: 9
-- MpAttributes: PEPCODE:HasDigitalSignature

if peattributes.isexe == true or peattributes.isdll == true then
  local l_0_0 = mp.getfilesize()
  local l_0_1 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_SECURITY].RVA
  local l_0_2 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_SECURITY].Size
  if l_0_1 == 0 or l_0_2 < 3654 or l_0_0 <= l_0_1 or l_0_2 > l_0_0 - l_0_1 then
    return mp.CLEAN
  end
  mp.readprotection(false)
  local l_0_3 = 128
  local l_0_4 = mp.readfile(l_0_1 + 3526, l_0_3)
  local l_0_5 = mp.crc32(-1, l_0_4, 1, l_0_3)
  if l_0_5 == 381009505 or l_0_5 == 1730649905 then
    return mp.INFECTED
  end
end
return mp.CLEAN
