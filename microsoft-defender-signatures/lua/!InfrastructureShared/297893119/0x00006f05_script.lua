-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\297893119\0x00006f05_luac 

-- params : ...
-- function num : 0
if (hstrlog[1]).matched or (hstrlog[2]).matched then
  return mp.INFECTED
end
return mp.CLEAN

