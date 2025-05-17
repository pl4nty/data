-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaExeInsidecabA\1.luac 

-- params : ...
-- function num : 0
if (mp.enum_mpattributesubstring)("HSTR:Win32/Obfuse.PR!MTB") then
  (mp.set_mpattribute)("Lua:ObfusedFile")
  return mp.INFECTED
end
return mp.CLEAN

