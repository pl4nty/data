-- Threat: !InfrastructureShared
-- Name: !#Lua:JS/NeutrinoEK.Y!obfus
-- Type: 13
-- MpAttributes: ALFPER:JS/NeutrinoEK.Y

local r0_0 = mp.getfilesize()
if r0_0 > 4096 then
  return mp.CLEAN
end
mp.readprotection(false)
local r0_1 = mp.readfile(0, r0_0)
local r0_2 = 0
local r0_3, r0_4 = string.gsub(r0_1, "/%*%w-%*/", "")
r0_2 = r0_2 + r0_4
r0_3, r0_4 = string.gsub(r0_3, "\\x(%x%x)",
  function(p1_0)
    return string.format("%c", tonumber(p1_0, 16))
  end)
r0_2 = r0_2 + r0_4
repeat
  r0_3, r0_4 = string.gsub(r0_3, '"([%w-%.%s/]-)"%+"([%w-%.%s/]-)"', '"%1%2"')
  r0_2 = r0_2 + r0_4
until r0_4 == 0
repeat
  r0_3, r0_4 = string.gsub(r0_3, "(%d+)%+(%d+)",
    function(p2_0, p2_1)
      return p2_0 + p2_1
    end)
  r0_2 = r0_2 + r0_4
until r0_4 == 0
repeat
  r0_3, r0_4 = string.gsub(r0_3, "(%d%d?)%-(%d%d?)",
    function(p3_0, p3_1)
      return p3_0 - p3_1
    end)
  r0_2 = r0_2 + r0_4
until r0_4 == 0
repeat
  r0_3, r0_4 = string.gsub(r0_3, ';(%a)%["(%w+)"%]%(', ";%1.%2(")
  r0_2 = r0_2 + r0_4
until r0_4 == 0
if r0_2 > 3 then
  mp.vfo_add_buffer(r0_3, "[NeutrinoEK.Y]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
end
return mp.CLEAN
