-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\ba7873942\1.luac 

-- params : ...
-- function num : 0
if (hstrlog[9]).matched or mp.HSTR_WEIGHT >= 3 then
  return mp.INFECTED
end
return mp.LOWFI

