-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanWin32CharFNameSA\0x000007c1_luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0, l_1_1)
  -- function num : 0_0
  local l_1_2 = l_1_0:byte(l_1_1)
  if not l_1_2 then
    return nil
  end
  if l_1_2 < 128 then
    return l_1_2, l_1_1 + 1
  end
  local l_1_3 = 0
  local l_1_4 = 0
  if l_1_2 >= 194 and l_1_2 <= 223 then
    l_1_3 = 2
    l_1_4 = 128
  else
    if l_1_2 >= 224 and l_1_2 <= 239 then
      l_1_3 = 3
      l_1_4 = 2048
    else
      if l_1_2 >= 240 and l_1_2 <= 244 then
        l_1_3 = 4
        l_1_4 = 65536
      else
        return nil
      end
    end
  end
  local l_1_5 = l_1_2 % 2 ^ (8 - l_1_3)
  for l_1_9 = 2, l_1_3 do
    local l_1_10 = l_1_0:byte(l_1_1 + l_1_9 - 1)
    if not l_1_10 or l_1_10 < 128 or l_1_10 > 191 then
      return nil
    end
    l_1_5 = l_1_5 * 64 + l_1_10 % 64
  end
  if l_1_5 < l_1_4 then
    return nil
  end
  return l_1_5, l_1_1 + l_1_3
end

do
  local l_0_2 = function(l_2_0)
  -- function num : 0_1 , upvalues : l_0_0
  local l_2_1 = 1
  local l_2_2 = 0
  while 1 do
    if l_2_1 <= #l_2_0 then
      local l_2_3 = l_0_0(l_2_0, l_2_1)
    end
    if not l_2_3 then
      break
    end
    if l_2_3 >= 119808 and l_2_3 <= 120831 then
      l_2_2 = l_2_2 + 1
      if l_2_2 >= 2 then
        return true
      end
    end
    l_2_1 = 
  end
  do
    return false
  end
end

  if not (mp.getfilename)(mp.FILEPATH_QUERY_FNAME) then
    return mp.CLEAN
  end
  if not ((mp.getfilename)(mp.FILEPATH_QUERY_FNAME)):match("[\128-\255]") then
    return mp.CLEAN
  end
  if l_0_2((mp.getfilename)(mp.FILEPATH_QUERY_FNAME)) == true then
    return mp.INFECTED
  end
  do return mp.CLEAN end
  -- DECOMPILER ERROR at PC32: freeLocal<0 in 'ReleaseLocals'

end

