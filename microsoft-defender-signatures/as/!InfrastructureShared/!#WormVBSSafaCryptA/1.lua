-- Threat: !InfrastructureShared
-- Name: !#Worm:VBS/SafaCrypt.A
-- Type: 13
-- MpAttributes: !SCPT:JenxcusCyberCrypt & (Trojan:VBS/Crypter.A | Trojan:VBS/Crypter.B | Trojan:VBS/Crypter.E | SCRIPT:Trojan:VBS/Crypter.A.1)

mp.readprotection(false)
if mp.getfilesize() >= 1792 then
  local l_0_0 = mp.readfile(0, 1792)
  local l_0_1, l_0_2 = string.find(l_0_0, "[dD][eE][cC][rR][yY][pP][tT]")
  local l_0_3 = false
  local l_0_4
  if l_0_1 ~= nil then
    l_0_4 = mp.readfile(l_0_1 + 8, mp.getfilesize() - l_0_1 - 8)
    l_0_3 = true
  else
    local l_0_5, l_0_6 = string.find(l_0_0, "\"[A-Za-z0-9%+/][A-Za-z0-9%+/][A-Za-z0-9%+/][A-Za-z0-9%+/][A-Za-z0-9%+/][A-Za-z0-9%+/][A-Za-z0-9%+/][A-Za-z0-9%+/]")
    if l_0_5 ~= nil then
      l_0_4 = mp.readfile(l_0_5, mp.getfilesize() - l_0_5)
      l_0_3 = true
    end
  end
  if l_0_3 then
    mp.set_mpattribute("//MpBase64DecodeLongLines")
    local l_0_7 = l_0_4:gsub("\"%).+", "")
    local l_0_8 = l_0_7:len()
    local l_0_9 = l_0_8 - l_0_8 / 4 * 4
    mp.vfo_add_buffer(l_0_7 .. string.rep("=", l_0_9), "[Safa_Crypt]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
  end
end
return mp.CLEAN
