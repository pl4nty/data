-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanWin64RandomPhraseB\0x00001a96_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)()
if not l_0_0 then
  return mp.CLEAN
end
if (string.find)(l_0_0:lower(), "keepas", 1, true) or (string.find)(l_0_0:lower(), "betterjpeg", 1, true) or (string.find)(l_0_0:lower(), "xiyou", 1, true) or (string.find)(l_0_0:lower(), "ddnet", 1, true) or (string.find)(l_0_0:lower(), "webissues", 1, true) or (string.find)(l_0_0:lower(), "\\program files", 1, true) then
  return mp.CLEAN
end
local l_0_1 = (pe.get_versioninfo)()
if not l_0_1 then
  return mp.CLEAN
end
if not l_0_1.FileDescription or not l_0_1.InternalName or not l_0_1.ProductName or not l_0_1.LegalCopyright or not l_0_1.CompanyName then
  return mp.CLEAN
end
if l_0_1.FileDescription == l_0_1.InternalName and l_0_1.InternalName == l_0_1.ProductName and (string.find)((l_0_1.LegalCopyright):lower(), "copyright (c)", 1, true) and ((string.find)((l_0_1.LegalCopyright):lower(), (l_0_1.InternalName):lower() .. " team", 1, true) or (string.find)((l_0_1.LegalCopyright):lower(), (l_0_1.InternalName):lower() .. " inc.", 1, true)) and (l_0_1.CompanyName):lower() == (l_0_1.InternalName):lower() .. " team" then
  return mp.INFECTED
end
return mp.CLEAN

