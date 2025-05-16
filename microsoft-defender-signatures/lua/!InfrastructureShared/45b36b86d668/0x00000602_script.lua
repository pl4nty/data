-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\45b36b86d668\0x00000602_luac 

-- params : ...
-- function num : 0
(bm.DisableSignature)()
count_nonascii_charset = function(l_1_0)
  -- function num : 0_0
  local l_1_1 = 0
  local l_1_2 = 1
  local l_1_3 = 255
  while 1 do
    if l_1_2 <= l_1_3 then
      local l_1_4 = l_1_0:byte(l_1_2)
    end
    if not l_1_4 then
      break
    end
    local l_1_5, l_1_6, l_1_7 = l_1_0:byte(l_1_2 + 1, l_1_2 + 3)
    local l_1_8 = nil
    if l_1_4 >= 240 and l_1_4 <= 244 and l_1_5 and l_1_6 and l_1_7 then
      l_1_8 = (l_1_4 - 240) * 262144 + (l_1_5 - 128) * 4096 + (l_1_6 - 128) * 64 + (l_1_7 - 128)
      l_1_2 = l_1_2 + 4
    else
      if l_1_4 >= 224 and l_1_4 <= 239 and l_1_5 and l_1_6 then
        l_1_8 = (l_1_4 - 224) * 4096 + (l_1_5 - 128) * 64 + (l_1_6 - 128)
        l_1_2 = l_1_2 + 3
      else
        if l_1_4 >= 192 and l_1_4 <= 223 and l_1_5 then
          l_1_8 = (l_1_4 - 192) * 64 + (l_1_5 - 128)
          l_1_2 = l_1_2 + 2
        else
          l_1_8 = l_1_4
          l_1_2 = l_1_2 + 1
        end
      end
    end
    if not l_1_8 or l_1_8 > 127 then
      l_1_1 = l_1_1 + 1
    end
  end
  do
    return l_1_1
  end
end

local l_0_0 = ((bm.get_current_process_startup_info)()).ppid
if l_0_0 ~= nil then
  local l_0_1 = (string.lower)((mp.GetProcessCommandLine)(l_0_0))
  if l_0_1 ~= nil then
    l_0_1 = (string.lower)(l_0_1)
    local l_0_2 = 0
    l_0_2 = count_nonascii_charset(l_0_1)
    if l_0_2 > 0 then
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

