-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2b6b32277aad6\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = ""
local l_0_2 = 0
for l_0_6 = 1, l_0_0 do
  if (sigattr_tail[l_0_6]).attribute == 16386 then
    local l_0_7 = ((sigattr_tail[l_0_6]).utf8p2):lower()
    local l_0_8 = ((sigattr_tail[l_0_6]).utf8p1):lower()
    if l_0_8:sub(1, #l_0_7) == l_0_7 then
      local l_0_9 = l_0_8:sub(#l_0_7 + 1)
      if l_0_9 and (mp.GetExtensionClass)(l_0_9) == 0 then
        if l_0_1 == nil then
          l_0_1 = l_0_9
          l_0_2 = l_0_2 + 1
        else
          if l_0_9 == l_0_1 then
            l_0_2 = l_0_2 + 1
          end
        end
      end
    end
  end
  do
    do
      if l_0_2 >= 5 and l_0_1 and isKnownRansomExtension(l_0_1) then
        return mp.INFECTED
      end
      -- DECOMPILER ERROR at PC61: LeaveBlock: unexpected jumping out DO_STMT

    end
  end
end
return mp.CLEAN

