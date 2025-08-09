-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFLLM_Python\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.enum_mpattributesubstring)("cnt:python:llm")
if not l_0_0 or #l_0_0 == 0 then
  return mp.CLEAN
end
l_0_0 = table_dedup(l_0_0)
set_research_data("pyt_llm_attribs", (table.concat)(l_0_0, "|"), false)
local l_0_1 = (mp.enum_mpattributesubstring)("cnt:llm")
if l_0_1 and #l_0_1 > 0 then
  l_0_1 = table_dedup(l_0_1)
  set_research_data("llm_attribs", (table.concat)(l_0_1, "|"), false)
end
local l_0_2 = (mp.enum_mpattributesubstring)("cnt:pyt:execute")
if l_0_2 and #l_0_2 > 0 then
  l_0_2 = table_dedup(l_0_2)
  set_research_data("exec", (table.concat)(l_0_1, "|"), false)
end
return mp.INFECTED

