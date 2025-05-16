-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\46780d4d6\0x000080e0_luac 

-- params : ...
-- function num : 0
if (hstrlog[1]).matched and (hstrlog[2]).matched and (hstrlog[3]).matched then
  return mp.INFECTED
end
return mp.CLEAN

