-- Threat: !InfrastructureShared
-- Name: 2129332d5c9c
-- Type: 21

local l_0_0 = mp.getfilesize()
if not l_0_0 or l_0_0 <= 0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = tostring(l_0_1)
if not l_0_2 or #l_0_2 == 0 then
  return mp.CLEAN
end
mp.readprotection(true)

local function l_0_3(l_1_0)
  local l_1_1 = {
    "%!%[%]%+%[%]",
    "%!%!%[%]%+%[%]",
    "%[%]%[%[%]%]",
    "%(%!%[%]%+%[%]%)%[",
    "%(%!%!%[%]%+%[%]%)%[",
    "%(%{%}%+%[%]%)",
    "%[%]%+%{%}"
  }
  local l_1_2 = 0
  for l_1_3, l_1_4 in ipairs(l_1_1) do
    if l_1_0:match(l_1_4) then
      l_1_2 = l_1_2 + 1
      if 2 <= l_1_2 then
        return true
      end
    end
  end
  return false
end

local l_0_4 = l_0_3(l_0_2)
if l_0_4 then
  return mp.INFECTED
end
return mp.CLEAN
