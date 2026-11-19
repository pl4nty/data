-- Threat: !InfrastructureShared
-- Name: !#Lua:Win32/Tss.Packed
-- Type: 10

local l_0_0 = {
  Armadillo = "!Armadillo+",
  Aspack = "Aspack+",
  ASProtect = "!ASProtect+",
  AutoHotKey = "AutoHotKey+",
  CodeVirtualizer = "!CodeVirtualizer",
  Enigma = "!Enigma",
  ExeCryptor = "!ExeCryptor",
  ExeStealth = "!ExeStealth+",
  eXPressor = "!eXPressor",
  Hupipack = "!Hupipack",
  Kkrunchy = "!Kkrunchy+",
  NSPack = "NSPack+",
  Obsidium = "!Obsidium+",
  SVKP = "SVKP+",
  tElock = "!tElock+",
  Themida = "!Themida",
  UPack = "!UPack+",
  UPX = "UPX_+"
}
for l_0_1, l_0_2 in pairs(l_0_0) do
  if mp.ispackedwith(l_0_2) then
    mp.set_mpattribute("Lua:Win32/Tss.Packed." .. l_0_1)
    return mp.INFECTED
  end
end
return mp.CLEAN
