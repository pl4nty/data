-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\15a78b9b0\0x0000ab7f_luac 

-- params : ...
-- function num : 0
if (hstrlog[1]).matched or (hstrlog[2]).matched or (hstrlog[3]).matched or (hstrlog[4]).matched then
  if mp.HSTR_WEIGHT >= 110 then
    return mp.INFECTED
  else
    if mp.HSTR_WEIGHT >= 60 then
      return mp.LOWFI
    end
  end
end
return mp.CLEAN

