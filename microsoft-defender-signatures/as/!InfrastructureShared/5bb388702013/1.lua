-- Threat: !InfrastructureShared
-- Name: 5bb388702013
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = safeJsonDeserialize(l_0_0)
local l_0_1 = 0
if l_0_0 ~= nil then
  local l_0_2 = l_0_0.sig_count or nil
  if l_0_2 ~= nil and l_0_2 < 60 then
    l_0_2 = 1
    local l_0_3 = l_0_0.file_size
    local l_0_4 = {}
    local l_0_5 = true
    local l_0_6, l_0_7, l_0_8, l_0_9
    if l_0_3 ~= nil then
      for l_0_10 = 1, #l_0_3, 4 do
        l_0_6 = l_0_3[l_0_10]
        l_0_7 = l_0_3[l_0_10 + 1]
        l_0_8 = l_0_3[l_0_10 + 2]
        l_0_9 = l_0_3[l_0_10 + 3]
        if l_0_6 ~= nil and l_0_7 ~= nil and l_0_8 ~= nil and l_0_9 ~= nil then
          if l_0_4[l_0_7] == nil then
            l_0_4[l_0_7] = 1
            l_0_1 = l_0_1 + 1
          end
          if l_0_4[l_0_9] == nil then
            l_0_4[l_0_9] = 1
            l_0_1 = l_0_1 + 1
          end
          if l_0_7 < 1024 or l_0_9 < 1024 then
            l_0_5 = false
          end
        end
      end
    end
    if l_0_5 == true and 8 <= l_0_1 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
