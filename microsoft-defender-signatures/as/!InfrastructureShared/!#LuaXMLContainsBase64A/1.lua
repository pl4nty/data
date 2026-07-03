-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaXMLContainsBase64A\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  local l_1_1 = 256
  local l_1_2 = 0
  local l_1_3 = false
  local l_1_4 = false
  for l_1_8 = 1, #l_1_0 do
    local l_1_9 = l_1_0:byte(l_1_8)
    -- DECOMPILER ERROR at PC21: Unhandled construct in 'MakeBoolean' P3

    if (l_1_9 >= 65 and l_1_9 <= 90) or l_1_9 < 97 or l_1_9 == 61 then
      l_1_2 = l_1_2 + 1
    else
      if l_1_9 >= 48 and l_1_9 <= 57 then
        l_1_2 = l_1_2 + 1
        l_1_3 = true
      else
        if l_1_9 == 43 or l_1_9 == 47 then
          l_1_2 = l_1_2 + 1
          l_1_4 = true
        else
          l_1_2 = 0
        end
      end
    end
    if l_1_1 <= l_1_2 and l_1_3 and l_1_4 then
      return true
    end
  end
  return false
end

local l_0_1 = tostring(headerpage)
local l_0_2 = tostring(footerpage)
local l_0_3 = false
if l_0_0(l_0_1) then
  (mp.set_mpattribute)("Lua:XMLContainsBase64.A!Header")
  l_0_3 = true
end
if l_0_0(l_0_2) then
  (mp.set_mpattribute)("Lua:XMLContainsBase64.A!Footer")
  l_0_3 = true
end
if l_0_3 then
  return mp.INFECTED
end
return mp.CLEAN

