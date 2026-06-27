-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\186b3b453938b\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched and not (this_sigattrlog[2]).matched then
  return mp.CLEAN
end
local l_0_0 = nil
local l_0_1 = this_sigattrlog[3]
if l_0_0 == nil and l_0_1 ~= nil and l_0_1.matched and not isnull(l_0_1.utf8p2) then
  l_0_0 = l_0_1.utf8p2
end
l_0_1 = this_sigattrlog[4]
if l_0_0 == nil and l_0_1 ~= nil and l_0_1.matched and not isnull(l_0_1.utf8p2) then
  l_0_0 = l_0_1.utf8p2
end
l_0_1 = this_sigattrlog[5]
if l_0_0 == nil and l_0_1 ~= nil and l_0_1.matched and not isnull(l_0_1.utf8p2) then
  l_0_0 = l_0_1.utf8p2
end
do
  if isnull(l_0_0) then
    local l_0_2 = (bm.get_current_process_startup_info)()
    if not isnull(l_0_2) and l_0_2.command_line ~= nil then
      l_0_0 = l_0_2.command_line
    end
  end
  if isnull(l_0_0) then
    return mp.CLEAN
  end
  local l_0_3 = (string.lower)(l_0_0)
  if not (string.find)(l_0_3, "jsonrpc", 1, true) then
    return mp.CLEAN
  end
  local l_0_4 = contains
  local l_0_5 = l_0_3
  local l_0_6 = {}
  -- DECOMPILER ERROR at PC112: No list found for R5 , SetList fails

  -- DECOMPILER ERROR at PC116: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC117: Overwrote pending register: R3 in 'AssignReg'

  if not l_0_4 then
    return l_0_4
  end
  -- DECOMPILER ERROR at PC119: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC120: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC126: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC127: Overwrote pending register: R4 in 'AssignReg'

  if l_0_4 == nil or not l_0_5 then
    return l_0_5
  end
  -- DECOMPILER ERROR at PC129: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC132: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC134: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC135: Overwrote pending register: R6 in 'AssignReg'

  if l_0_5 or l_0_6 == "" then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC144: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC145: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC146: Overwrote pending register: R9 in 'AssignReg'

  if (string.find)(" mcp", "mcp-server", "mcp_servers", true) or (string.find)(l_0_6, "localhost", 1, true) or (string.find)(l_0_6, "::1", 1, true) or (string.find)(l_0_6, "0.0.0.0", 1, true) or (string.find)(l_0_6, "10.", 1, true) or (string.find)(l_0_6, "192.168.", 1, true) or (string.find)(l_0_6, "169.254.", 1, true) or (string.find)(l_0_6, "fe80:", 1, true) then
    return mp.CLEAN
  end
  local l_0_7 = (string.match)(l_0_6, "^172%.(%d+)%.")
  do
    do
      if l_0_7 ~= nil then
        local l_0_8 = tonumber(l_0_7)
        if l_0_8 ~= nil and l_0_8 >= 16 and l_0_8 <= 31 then
          return mp.CLEAN
        end
      end
      ;
      (bm.add_related_string)("openclaw_mcp_channel", "external_jsonrpc", bm.RelatedStringBMReport)
      -- DECOMPILER ERROR at PC247: Overwrote pending register: R11 in 'AssignReg'

      TrackPidAndTechniqueBM("BM", "T1102", "openclaw_mcp_channel", "tools/list")
      add_parents()
      do return mp.INFECTED end
      -- WARNING: undefined locals caused missing assignments!
    end
  end
end

