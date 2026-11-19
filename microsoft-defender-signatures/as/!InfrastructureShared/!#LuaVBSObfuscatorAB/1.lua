-- Threat: !InfrastructureShared
-- Name: !#Lua:VBS/Obfuscator.AB
-- Type: 13
-- MpAttributes: ALFPER:VBS/Obfuscator.AB

local l_0_0 = mp.getfilesize()
if 65536 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
local l_0_2, l_0_3 = string.gsub(l_0_1, "chr%(&o(%d%d%d)&%)", function(l_1_0)
  return string.format("\"%c\"", tonumber(l_1_0, 8))
end)
if l_0_2 and 10 < l_0_3 then
  l_0_2 = string.gsub(l_0_2, "chr%(&o(%d%d)&%)", function(l_2_0)
    return string.format("\"%c\"", tonumber(l_2_0, 8))
  end)
  l_0_2 = string.gsub(l_0_2, "\"&\"(.)\"", "%1")
  l_0_2 = string.gsub(l_0_2, "\"&\"", "")
  l_0_2 = string.gsub(l_0_2, "&\"", "")
  mp.vfo_add_buffer(l_0_2, "[Obfuscator.AB]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
end
return mp.CLEAN
