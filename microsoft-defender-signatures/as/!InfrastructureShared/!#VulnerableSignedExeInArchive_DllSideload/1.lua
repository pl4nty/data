-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#VulnerableSignedExeInArchive_DllSideload\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (pe.get_versioninfo)()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = l_0_0.LegalCopyright
if l_0_1 and (string.find)((string.lower)(l_0_1), "asus", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN

