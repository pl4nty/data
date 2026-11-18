-- Threat: !InfrastructureShared
-- Name: 85b3fe6128bb
-- Type: 21

local l_0_0 = {}
local l_0_1 = {}
local l_0_2 = {}
local l_0_3 = {}
local l_0_4 = {}
local l_0_5 = {}
local l_0_6 = {}
local l_0_7 = {}
local l_0_8 = "[A-Za-z]"
local l_0_9 = 2
for l_0_10 = 1, mp.SIGATTR_LOG_SZ do
  local l_0_11 = string.lower(sigattr_head[l_0_10].utf8p1)
  if sigattr_head[l_0_10].matched then
    if string.find(l_0_11, ":\\", 1, true) == 2 then
      local l_0_12 = string.sub(l_0_11, 0, 1)
      if string.len(l_0_12) == 1 and string.match(l_0_12, l_0_8) then
        if sigattr_head[l_0_10].attribute == 16384 then
          l_0_0[l_0_12] = 1
        elseif sigattr_head[l_0_10].attribute == 16385 then
          l_0_1[l_0_12] = 1
        elseif sigattr_head[l_0_10].attribute == 16386 then
          l_0_2[l_0_12] = 1
        elseif sigattr_head[l_0_10].attribute == 16387 then
          l_0_3[l_0_12] = 1
        end
      end
    elseif string.find(l_0_11, "\\\\", 1, true) == 0 then
      local l_0_13
      if string.find(l_0_11, "\\", 3, true) then
        l_0_13 = string.sub(l_0_11, 2, string.find(l_0_11, "\\", 3, true) - 2)
      else
        l_0_13 = string.sub(l_0_11, 2)
      end
      if 1 <= string.len(l_0_13) and string.len(l_0_13) <= 255 then
        if sigattr_head[l_0_10].attribute == 16384 then
          l_0_4[l_0_13] = 1
        elseif sigattr_head[l_0_10].attribute == 16385 then
          l_0_5[l_0_13] = 1
        elseif sigattr_head[l_0_10].attribute == 16386 then
          l_0_6[l_0_13] = 1
        elseif sigattr_head[l_0_10].attribute == 16387 then
          l_0_7[l_0_13] = 1
        end
      end
    end
  end
end
if l_0_9 <= #l_0_0 or l_0_9 <= #l_0_1 or l_0_9 <= #l_0_2 or l_0_9 <= #l_0_3 or l_0_9 <= #l_0_4 or l_0_9 <= #l_0_5 or l_0_9 <= #l_0_6 or l_0_9 <= #l_0_7 then
  return mp.INFECTED
end
return mp.CLEAN
