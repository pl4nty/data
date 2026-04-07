-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\170b3d23a1767\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched then
  return mp.CLEAN
end
if not (this_sigattrlog[5]).matched or (this_sigattrlog[5]).utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = (bm.get_imagepath)()
if isnull(l_0_0) then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if (string.find)(l_0_0, "\\windows defender\\msmpeng.exe", 1, true) then
  return mp.CLEAN
end
local l_0_1 = {}
-- DECOMPILER ERROR at PC60: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC61: Overwrote pending register: R2 in 'AssignReg'

local l_0_2 = (("\\msbuild.exe").get_current_process_startup_info)()
-- DECOMPILER ERROR at PC66: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC71: Overwrote pending register: R4 in 'AssignReg'

if l_0_2 and "\\devenv.exe" then
  local l_0_3 = (string.lower)("\\dotnet.exe")
  -- DECOMPILER ERROR at PC74: Overwrote pending register: R5 in 'AssignReg'

  for l_0_7,l_0_8 in ipairs("\\visual studio\\") do
    -- DECOMPILER ERROR at PC77: Overwrote pending register: R9 in 'AssignReg'

    -- DECOMPILER ERROR at PC79: Overwrote pending register: R10 in 'AssignReg'

    -- DECOMPILER ERROR at PC80: Overwrote pending register: R11 in 'AssignReg'

    if (("\\omnisharp").find)("\\roslyn\\", "\\microsoft.net\\framework", 1, true) then
      return mp.CLEAN
    end
  end
end
do
  -- DECOMPILER ERROR at PC92: Overwrote pending register: R3 in 'AssignReg'

  local l_0_9 = nil
  local l_0_10 = nil
  -- DECOMPILER ERROR at PC106: Overwrote pending register: R5 in 'AssignReg'

  local l_0_11 = nil
  l_0_11 = ipairs
  l_0_11 = l_0_11(l_0_9)
  for l_0_15,l_0_16 in l_0_11 do
    local l_0_16 = nil
    l_0_16 = string
    l_0_16 = l_0_16.find
    l_0_16 = l_0_16(l_0_3, l_0_15, 1, true)
    -- DECOMPILER ERROR at PC120: Overwrote pending register: R5 in 'AssignReg'

    if l_0_16 then
      break
    end
  end
  do
    if not l_0_10 then
      return mp.CLEAN
    end
    ;
    (bm.add_related_string)("cad_compiler", l_0_0, bm.RelatedStringBMReport)
    ;
    (bm.add_related_string)("cad_output", l_0_3, bm.RelatedStringBMReport)
    add_parents()
    TrackPidAndTechniqueBM("BM", "T1127.001", "SuspCompileAfterDelivery")
    do return mp.INFECTED end
    -- DECOMPILER ERROR at PC153: Confused about usage of register R6 for local variables in 'ReleaseLocals'

  end
end

