-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaEP_FirstByteOfCodeIsJump\1.luac 

-- params : ...
-- function num : 0
if pehdr.AddressOfEntryPoint == 4096 and epcode[1] == 233 then
  return mp.INFECTED
end
return mp.CLEAN

