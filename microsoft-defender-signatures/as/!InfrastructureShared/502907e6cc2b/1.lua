-- Threat: !InfrastructureShared
-- Name: 502907e6cc2b
-- Type: 21

local l_0_0 = mp.getfilesize()
if 98304 < l_0_0 then
  return mp.CLEAN
end
if l_0_0 < 40960 then
  return mp.CLEAN
end
local l_0_1 = tostring(headerpage)
if string.find(l_0_1, "\n", 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_2, l_0_3, l_0_4, l_0_5 = l_0_1:match("%(function%((%l%l%l%l%l%l+),(%l%l%l%l%l%l+)%){(%l%l%l%l%l%l+)=function%(%){return (%l%l%l%l%l%l+)%.pop%(%)}")
local l_0_6 = #l_0_3 - 1
local l_0_7 = #l_0_3 + 1
if #l_0_2 ~= #l_0_3 and #l_0_2 ~= l_0_6 and #l_0_2 ~= l_0_7 or #l_0_3 ~= #l_0_4 and l_0_6 ~= #l_0_4 and l_0_7 ~= #l_0_4 or #l_0_3 ~= #l_0_5 and l_0_6 ~= #l_0_5 and l_0_7 ~= #l_0_5 then
  return mp.CLEAN
end
mp.set_mpattribute("SCRIPT:Worm:JS/Proslikefan_Lowfi2")
return mp.CLEAN
