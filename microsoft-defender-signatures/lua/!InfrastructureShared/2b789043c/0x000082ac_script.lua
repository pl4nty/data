-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2b789043c\0x000082ac_luac 

-- params : ...
-- function num : 0
if pehdr.SizeOfImage > 2097152 then
  (mp.set_mpattribute)("PUA:Block:Ardamax:Bit")
  return mp.INFECTED
end
return mp.CLEAN

