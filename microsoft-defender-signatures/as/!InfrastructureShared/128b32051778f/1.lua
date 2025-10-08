-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\128b32051778f\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0.ppid ~= nil and ((string.find)(l_0_0.ppid, "pid:4$", 1, false) ~= nil or (string.find)(l_0_0.ppid, "pid:4,", 1, true) ~= nil) then
  return mp.INFECTED
end
local l_0_1 = (mp.GetParentProcInfo)()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = GetFileName(l_0_1.image_path)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
do
  local l_0_3 = {}
  -- DECOMPILER ERROR at PC51: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC52: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC53: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC54: Overwrote pending register: R6 in 'AssignReg'

  if ("wmiprvse.exe")("wsmprovhost.exe", "winrshost.exe") then
    return mp.INFECTED
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

