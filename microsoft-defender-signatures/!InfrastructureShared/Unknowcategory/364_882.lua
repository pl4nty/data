-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\364_882.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
l_0_0.Armadillo = "!Armadillo+"
l_0_0.Aspack = "Aspack+"
l_0_0.ASProtect = "!ASProtect+"
l_0_0.CodeVirtualizer = "!CodeVirtualizer"
l_0_0.Enigma = "!Enigma"
l_0_0.ExeCryptor = "!ExeCryptor"
l_0_0.ExeStealth = "!ExeStealth+"
l_0_0.eXPressor = "!eXPressor"
l_0_0.Hupipack = "!Hupipack"
l_0_0.Kkrunchy = "!Kkrunchy+"
l_0_0.NSPack = "NSPack+"
l_0_0.NSIS = "!NSIS+"
l_0_0.Obsidium = "!Obsidium+"
l_0_0.PECompact = "PECompact+"
l_0_0.SVKP = "SVKP+"
l_0_0.tElock = "!tElock+"
l_0_0.Themida = "!Themida"
l_0_0.UPack = "!UPack+"
l_0_0.UPX = "UPX_+"
for l_0_4,l_0_5 in pairs(l_0_0) do
  if (mp.ispackedwith)(l_0_5) then
    (mp.set_mpattribute)("Lua:Win32/Tss.Packed." .. l_0_4)
    return mp.INFECTED
  end
end
return mp.CLEAN

