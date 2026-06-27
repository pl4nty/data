-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\169b382aef189\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1, l_0_2 = nil, nil
local l_0_3 = nil
-- DECOMPILER ERROR at PC6: Confused about usage of register: R2 in 'UnsetPending'

-- DECOMPILER ERROR at PC10: Confused about usage of register: R2 in 'UnsetPending'

-- DECOMPILER ERROR at PC14: Confused about usage of register: R2 in 'UnsetPending'

if l_0_3 == nil and this_sigattrlog[1] ~= nil and (this_sigattrlog[1]).matched and not isnull((this_sigattrlog[1]).utf8p1) then
  l_0_3 = (this_sigattrlog[1]).utf8p1
end
-- DECOMPILER ERROR at PC22: Confused about usage of register: R2 in 'UnsetPending'

-- DECOMPILER ERROR at PC26: Confused about usage of register: R2 in 'UnsetPending'

-- DECOMPILER ERROR at PC30: Confused about usage of register: R2 in 'UnsetPending'

-- DECOMPILER ERROR at PC31: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC38: Confused about usage of register: R2 in 'UnsetPending'

-- DECOMPILER ERROR at PC42: Confused about usage of register: R2 in 'UnsetPending'

-- DECOMPILER ERROR at PC46: Confused about usage of register: R2 in 'UnsetPending'

-- DECOMPILER ERROR at PC46: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC47: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC54: Confused about usage of register: R2 in 'UnsetPending'

-- DECOMPILER ERROR at PC58: Confused about usage of register: R2 in 'UnsetPending'

-- DECOMPILER ERROR at PC62: Confused about usage of register: R2 in 'UnsetPending'

-- DECOMPILER ERROR at PC62: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC63: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC70: Confused about usage of register: R2 in 'UnsetPending'

-- DECOMPILER ERROR at PC74: Confused about usage of register: R2 in 'UnsetPending'

-- DECOMPILER ERROR at PC78: Confused about usage of register: R2 in 'UnsetPending'

-- DECOMPILER ERROR at PC78: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC79: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC86: Confused about usage of register: R2 in 'UnsetPending'

-- DECOMPILER ERROR at PC90: Confused about usage of register: R2 in 'UnsetPending'

-- DECOMPILER ERROR at PC94: Confused about usage of register: R2 in 'UnsetPending'

-- DECOMPILER ERROR at PC94: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC95: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC102: Confused about usage of register: R2 in 'UnsetPending'

-- DECOMPILER ERROR at PC106: Confused about usage of register: R2 in 'UnsetPending'

-- DECOMPILER ERROR at PC110: Confused about usage of register: R2 in 'UnsetPending'

-- DECOMPILER ERROR at PC110: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC111: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC119: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC119: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC119: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC119: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC119: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC119: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC119: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC119: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC119: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC119: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC119: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC119: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC119: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC119: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC119: Unhandled construct in 'MakeBoolean' P3

if (((((l_0_3 == nil and this_sigattrlog[2] ~= nil and (this_sigattrlog[2]).matched and not isnull((this_sigattrlog[2]).utf8p1) and l_0_3 ~= nil) or l_0_3 == nil) and l_0_3 ~= nil) or l_0_3 == nil) and l_0_3 ~= nil) or isnull(l_0_3) then
  return mp.CLEAN
end
local l_0_4 = "soul.md"
if isnull((bm.get_imagepath)()) then
  return mp.CLEAN
end
local l_0_5 = nil
local l_0_6 = nil
local l_0_7 = (string.lower)((bm.get_imagepath)())
-- DECOMPILER ERROR at PC151: Overwrote pending register: R6 in 'AssignReg'

if not isnull((bm.get_current_process_startup_info)()) and ((bm.get_current_process_startup_info)()).command_line ~= nil then
  local l_0_8 = nil
  local l_0_9 = ""
  local l_0_10 = contains
  l_0_10 = l_0_10(l_0_7, {"\\node.exe", "\\python.exe", "\\pythonw.exe", "\\pwsh.exe", "\\powershell.exe", "\\code.exe", "\\cursor.exe", "\\windsurf.exe", "\\claude.exe", "\\codex.exe", "\\copilot.exe", "\\antigravity.exe"})
  local l_0_11 = contains
  l_0_11 = l_0_11(l_0_9, {"openclaw", "mcp", "modelcontextprotocol", "agent", "assistant", "claude", "codex", "copilot", "cursor", "windsurf", "soul.md"})
  if not l_0_10 or not l_0_11 then
    return mp.CLEAN
  end
  do
    ;
    (bm.add_related_string)("agent_guardrail_file", l_0_4 or "unknown", bm.RelatedStringBMReport)
    TrackPidAndTechniqueBM("BM", "T1565.001", "Impact")
    add_parents()
    do return mp.INFECTED end
    -- DECOMPILER ERROR at PC211: freeLocal<0 in 'ReleaseLocals'

  end
end

