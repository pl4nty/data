-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanLinuxLLMPromptGraderB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = tostring(headerpage) .. tostring(footerpage)
local l_0_1, l_0_2 = LLMPromptGrader(l_0_0)
set_research_data("GradingInfo", (table.concat)(l_0_2, "|"), false)
return mp.INFECTED

