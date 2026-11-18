-- Threat: !InfrastructureShared
-- Name: !#SLF:Lua:AIAgentContextFile.A
-- Type: 13
-- Includes: LuaFuncHelper, BMLuaLib, ResearchData
-- MpAttributes: Lua:MDExt & RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = {
  ".claude",
  ".agents",
  ".copilot",
  ".aider",
  ".windsurf",
  ".gemini",
  ".autogen"
}
if not contains(l_0_1, l_0_3, true) then
  return mp.CLEAN
end
local l_0_4 = {
  ["agents.md"] = true,
  ["claude.md"] = true,
  ["claude_session.md"] = true,
  ["memory.md"] = true,
  ["task_plan.md"] = true,
  ["plan.md"] = true,
  ["skill.md"] = true,
  ["context.md"] = true,
  ["notes.md"] = true,
  ["research.md"] = true,
  ["soul.md"] = true,
  ["rules.md"] = true,
  ["instructions.md"] = true,
  ["scratchpad.md"] = true,
  ["gemini.md"] = true,
  ["windsurf.md"] = true,
  ["aider.md"] = true,
  ["architecture.md"] = true,
  ["tech_stack.md"] = true,
  ["decisions.md"] = true,
  ["api.md"] = true,
  ["conventions.md"] = true,
  ["workflow.md"] = true,
  ["manifest.md"] = true,
  ["prompts.md"] = true,
  ["learnings.md"] = true,
  ["todo.md"] = true,
  ["changelog.md"] = true,
  ["copilot-instructions.md"] = true,
  ["agent_context.md"] = true,
  ["project_details.md"] = true,
  ["development.md"] = true,
  ["brainstorm.md"] = true,
  ["logs.md"] = true,
  ["state.md"] = true,
  ["environment.md"] = true,
  ["standards.md"] = true,
  ["guidelines.md"] = true,
  ["chain_of_thought.md"] = true,
  ["thoughts.md"] = true
}
if not l_0_4[l_0_2] then
  return mp.CLEAN
end
local l_0_5 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH) or ""
local l_0_6 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME) or ""
local l_0_7 = {
  file = l_0_2,
  path = l_0_1,
  process = l_0_6,
  process_path = l_0_5
}
set_research_data("AIAgentContextFile", safeJsonSerialize(l_0_7), false)
return mp.INFECTED
