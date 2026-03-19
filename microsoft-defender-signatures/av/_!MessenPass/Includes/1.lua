-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!MessenPass\Includes\1.luac 

-- params : ...
-- function num : 0
if (pe.get_versioninfo)() == nil then
  return mp.CLEAN
end
if checkProductVersion("GTE", "1.43") == true then
  (mp.set_mpattribute)("PUA:Block:MessenPass")
  return mp.CLEAN
end
return mp.INFECTED

