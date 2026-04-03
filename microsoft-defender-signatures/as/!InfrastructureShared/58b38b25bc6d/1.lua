-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\58b38b25bc6d\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((this_sigattrlog[2]).utf8p1)
if not (string.find)(l_0_0, "\\.node", 1, true) then
  return mp.CLEAN
end
local l_0_1 = (bm.get_imagepath)()
if isnull(l_0_1) then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if (string.find)(l_0_1, "\\windows defender\\msmpeng.exe", 1, true) then
  return mp.CLEAN
end
do
  if not (string.find)(l_0_1, "\\electron", 1, true) and not (string.find)(l_0_0, "\\resources\\", 1, true) then
    local l_0_2, l_0_3 = (string.find)(l_0_0, "\\app.asar", 1, true)
  end
  -- DECOMPILER ERROR at PC85: Confused about usage of register: R2 in 'UnsetPending'

  if isnull(l_0_2) then
    return mp.CLEAN
  end
  local l_0_4 = nil
  for l_0_8,l_0_9 in ipairs({"better-sqlite3.node", "sharp.node", "fsevents.node", "keytar.node", "node-pty.node", "nsfw.node", "sodium-native.node"}) do
    local l_0_5 = nil
    -- DECOMPILER ERROR at PC108: Confused about usage of register: R8 in 'UnsetPending'

    if (string.find)(l_0_0, "node-pty.node", 1, true) then
      return mp.CLEAN
    end
  end
  local l_0_10 = nil
  local l_0_11 = {"coffloader.node", "scexec.node", "assembly.node", "inject.node", "shellcode.node", "payload.node", "beacon.node", "implant.node"}
  local l_0_12 = false
  for l_0_16,l_0_17 in ipairs(l_0_11) do
    local l_0_13 = nil
    -- DECOMPILER ERROR at PC138: Confused about usage of register: R11 in 'UnsetPending'

    if (string.find)(l_0_0, "beacon.node", 1, true) then
      l_0_12 = true
      -- DECOMPILER ERROR at PC145: Confused about usage of register: R11 in 'UnsetPending'

      l_0_13 = "beacon.node"
      break
    end
  end
  do
    ;
    (bm.add_related_string)("susp_node_module", l_0_0, bm.RelatedStringBMReport)
    ;
    (bm.add_related_string)("susp_node_proc", l_0_1, bm.RelatedStringBMReport)
    -- DECOMPILER ERROR at PC168: Confused about usage of register: R6 in 'UnsetPending'

    if l_0_12 then
      (bm.add_related_string)("susp_node_known_tool", l_0_13, bm.RelatedStringBMReport)
    end
    add_parents()
    TrackPidAndTechniqueBM("BM", "T1218.015", "SuspNodeModule")
    return mp.INFECTED
  end
end

