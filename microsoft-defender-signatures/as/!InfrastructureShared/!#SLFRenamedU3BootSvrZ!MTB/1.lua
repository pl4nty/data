-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFRenamedU3BootSvrZ!MTB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0 or l_0_0 == "" then
  return mp.CLEAN
end
l_0_0 = (MpCommon.PathToWin32Path)(l_0_0)
if not l_0_0 or l_0_0 == "" then
  return mp.CLEAN
end
if not StringEndsWith(l_0_0, ".exe") then
  return mp.CLEAN
end
local l_0_1 = {}
-- DECOMPILER ERROR at PC41: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC42: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC43: Overwrote pending register: R3 in 'AssignReg'

if ("\\program files")("\\program files (x86)", l_0_1) then
  return mp.CLEAN
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC55: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC56: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC57: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC58: Overwrote pending register: R5 in 'AssignReg'

if not ("\\programdata\\")("\\users\\", "\\windows\\temp\\") then
  return mp.CLEAN
end
local l_0_3 = (MpCommon.GetOriginalFileName)(l_0_0)
if not l_0_3 or l_0_3 == "" then
  return mp.CLEAN
end
do
  local l_0_4, l_0_5 = (string.match)(l_0_0, "[^\\]+$") or ""
  -- DECOMPILER ERROR at PC88: Confused about usage of register: R4 in 'UnsetPending'

  do
    if l_0_3 and l_0_3 ~= "" and l_0_4 ~= "" then
      local l_0_6 = nil
      if (string.lower)(l_0_3) == "u3boostsvr.exe" and (string.lower)(l_0_6) ~= (string.lower)(l_0_3) then
        return mp.INFECTED
      end
    end
    return mp.CLEAN
  end
end

