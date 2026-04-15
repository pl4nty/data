-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\133b3efc0ee72\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[2]).matched or not (this_sigattrlog[3]).matched or not (this_sigattrlog[4]).matched then
  return mp.CLEAN
end
if (this_sigattrlog[2]).utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((this_sigattrlog[2]).utf8p1)
if (string.find)(l_0_0, "\\node_modules\\", 1, true) then
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
local l_0_2 = {}
-- DECOMPILER ERROR at PC104: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC105: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC106: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC107: Overwrote pending register: R5 in 'AssignReg'

if ("\\microsoft teams\\")("\\teams\\", "\\microsoft\\teams\\", true) then
  return mp.CLEAN
end
local l_0_3 = {}
-- DECOMPILER ERROR at PC119: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC120: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC121: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC122: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC123: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC124: Overwrote pending register: R12 in 'AssignReg'

-- DECOMPILER ERROR at PC125: No list found for R3 , SetList fails

local l_0_4 = false
-- DECOMPILER ERROR at PC127: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC128: Overwrote pending register: R6 in 'AssignReg'

for l_0_8,l_0_9 in ("scexec.node")("assembly.node") do
  -- DECOMPILER ERROR at PC131: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC133: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC134: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC135: Overwrote pending register: R13 in 'AssignReg'

  if (("\\windsurf\\").find)("\\slack\\", "\\discord\\", "\\spotify\\", true) then
    break
  end
end
do
  local l_0_10 = {}
  -- DECOMPILER ERROR at PC154: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC155: No list found for R5 , SetList fails

  local l_0_11 = false
  -- DECOMPILER ERROR at PC157: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC158: Overwrote pending register: R8 in 'AssignReg'

  for l_0_15,l_0_16 in ("sharp.node")("fsevents.node") do
    -- DECOMPILER ERROR at PC161: Overwrote pending register: R12 in 'AssignReg'

    -- DECOMPILER ERROR at PC163: Overwrote pending register: R13 in 'AssignReg'

    -- DECOMPILER ERROR at PC164: Overwrote pending register: R14 in 'AssignReg'

    -- DECOMPILER ERROR at PC165: Overwrote pending register: R15 in 'AssignReg'

    if (("sodium-native.node").find)("registry.node", "kerberos.node", "\\notion\\", true) then
      break
    end
  end
  do
    do
      if l_0_11 then
        return mp.CLEAN
      end
      ;
      (bm.add_related_string)("loki_c2_proc", l_0_1, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("loki_c2_nodemod", l_0_0, bm.RelatedStringBMReport)
      if l_0_4 then
        (bm.add_related_string)("loki_c2_susp_module", "true", bm.RelatedStringBMReport)
      end
      if (this_sigattrlog[4]).utf8p1 then
        (bm.add_related_string)("loki_c2_action", (this_sigattrlog[4]).utf8p1, bm.RelatedStringBMReport)
      end
      add_parents()
      TrackPidAndTechniqueBM("BM", "T1059.007", "LokiC2Beacon")
      TrackPidAndTechniqueBM("BM", "T1071.001", "LokiC2Comms")
      do return mp.INFECTED end
      -- WARNING: undefined locals caused missing assignments!
    end
  end
end

