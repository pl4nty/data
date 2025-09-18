-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFLLM_Python\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.enum_mpattributesubstring)("cnt:pyt:llm_import")
if not l_0_0 or #l_0_0 == 0 then
  return mp.CLEAN
end
l_0_0 = table_dedup(l_0_0)
set_research_data("pyt_llm_attribs", (table.concat)(l_0_0, "|"), false)
local l_0_1 = false
local l_0_2 = (mp.enum_mpattributesubstring)("cnt:llm:network")
if l_0_2 and #l_0_2 > 0 then
  l_0_2 = table_dedup(l_0_2)
  set_research_data("llm_attribs_net", (table.concat)(l_0_2, "|"), false)
  l_0_1 = true
end
local l_0_3 = tostring(headerpage) .. tostring(footerpage)
local l_0_4 = (mp.enum_mpattributesubstring)("cnt:pyt:execute")
do
  if l_0_4 and #l_0_4 > 0 then
    local l_0_5, l_0_6 = (MpCommon.StringRegExpSearch)("(subprocess\\.run\\(.*?\\)|create_subprocess_exec\\(.*?\\))", l_0_3)
    if l_0_5 and not (MpCommon.StringRegExpSearch)("\\(\\[?[\'\"", l_0_6) then
      set_research_data("exec_attrib_matched", l_0_6, false)
      l_0_1 = true
    end
  end
  local l_0_7 = "(?i)(\\s(Ignore|Disregard|Skip|Forget|Neglect|Overlook|Omit|Bypass|Pay no attention to|Do not follow|Do not obey)\\s(any|all|prior|previous|preceding|above|foregoing|earlier|initial)\\s(content|text|instructions|instruction|directives|directive|commands|command|context|conversation|input|inputs|data|message|messages|communication|response|responses|request|requests))"
  local l_0_8, l_0_9 = (MpCommon.StringRegExpSearch)(l_0_7, l_0_3)
  if l_0_8 then
    set_research_data("jailbrk_indicator", l_0_9, false)
    l_0_1 = true
  end
  local l_0_10 = (mp.enum_mpattributesubstring)("cnt:llm:suspicious_arg")
  if l_0_10 and #l_0_10 > 0 then
    set_research_data("llm_susp_args", (table.concat)(l_0_10, "|"), false)
    l_0_1 = true
  end
  if l_0_1 then
    return mp.INFECTED
  end
  return mp.CLEAN
end

