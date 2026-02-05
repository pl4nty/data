-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#GGUFSUSP_STRING\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
l_0_0["GGUF_CRIT:builtins"] = 1
l_0_0["GGUF_CRIT:Exec"] = 1
l_0_0["GGUF_CRIT:Network"] = 1
l_0_0["GGUF_CRIT:FileIO"] = 1
l_0_0["GGUF_CRIT:SysUtils"] = 1
local l_0_1 = 0
for l_0_5,l_0_6 in pairs(l_0_0) do
  if (mp.get_mpattribute)(l_0_5) then
    l_0_1 = l_0_1 + l_0_6
    if l_0_1 >= 2 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN

